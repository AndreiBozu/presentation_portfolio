import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/theme/app_color.dart';

class LinkifiedText extends StatefulWidget {
  const LinkifiedText(
    this.text, {
    super.key,
    required this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
  });

  final String text;
  final TextStyle style;
  final TextStyle? linkStyle;
  final TextAlign textAlign;

  @override
  State<LinkifiedText> createState() => _LinkifiedTextState();
}

class _LinkifiedTextState extends State<LinkifiedText> {
  static final RegExp _urlRegExp = RegExp(
    r'((https?:\/\/)|(www\.))[^\s]+',
    caseSensitive: false,
  );

  final List<TapGestureRecognizer> _recognizers = [];

  @override
  void dispose() {
    _disposeRecognizers();
    super.dispose();
  }

  void _disposeRecognizers() {
    for (final recognizer in _recognizers) {
      recognizer.dispose();
    }
    _recognizers.clear();
  }

  Future<void> _open(String rawUrl) async {
    final String normalized =
        rawUrl.startsWith('www.') ? 'https://$rawUrl' : rawUrl;
    final Uri? uri = Uri.tryParse(normalized);
    if (uri == null) return;
    await launchUrl(
      uri,
      // Opens a new tab on web; uses the external browser elsewhere.
      webOnlyWindowName: '_blank',
      mode: LaunchMode.externalApplication,
    );
  }

  List<InlineSpan> _buildSpans() {
    _disposeRecognizers();

    final TextStyle linkStyle = widget.linkStyle ??
        widget.style.copyWith(
          color: AppColor.blueDark,
          decoration: TextDecoration.underline,
          decorationColor: AppColor.blueDark,
        );

    final List<InlineSpan> spans = [];
    int lastIndex = 0;

    for (final Match match in _urlRegExp.allMatches(widget.text)) {
      // Plain text before the link.
      if (match.start > lastIndex) {
        spans.add(TextSpan(text: widget.text.substring(lastIndex, match.start)));
      }

      String url = match.group(0)!;
      // Trailing punctuation isn't part of the link (e.g. "see www.x.com.").
      String trailing = '';
      while (url.isNotEmpty && '.,;:!?)]}\'"'.contains(url[url.length - 1])) {
        trailing = url[url.length - 1] + trailing;
        url = url.substring(0, url.length - 1);
      }

      final recognizer = TapGestureRecognizer()..onTap = () => _open(url);
      _recognizers.add(recognizer);

      spans.add(TextSpan(text: url, style: linkStyle, recognizer: recognizer));
      if (trailing.isNotEmpty) {
        spans.add(TextSpan(text: trailing));
      }

      lastIndex = match.end;
    }

    // Remaining plain text after the last link.
    if (lastIndex < widget.text.length) {
      spans.add(TextSpan(text: widget.text.substring(lastIndex)));
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(style: widget.style, children: _buildSpans()),
      textAlign: widget.textAlign,
    );
  }
}
