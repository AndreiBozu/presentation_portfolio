import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:presentation_portfolio/core/constant.dart';
import 'package:presentation_portfolio/data/models/get_in_touch_form_model.dart';
import 'package:http/http.dart' as http;


class GetInTouchUseCase {
  Future<GetInTouchFormValidationResponse> validateData({required GetInTouchFormModel form}) async {
    if(form.email.isEmpty || !(_isValidEmail(form.email))) {
      return GetInTouchFormValidationResponse(
        isSuccess: false,
        message: Constant.invalidEmail,
        isEmailError: true
      );
    } else if(form.message.isEmpty) {
      return GetInTouchFormValidationResponse(
        isSuccess: false,
        message: Constant.emptyMessage,
        isMessageError: true
      );
    } else {
      return GetInTouchFormValidationResponse(
        isSuccess: true,
        message: Constant.successMessage,
      );
    }
  }
  static bool _isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  void sendEmail({
    required String sender,
    required String message,
    String? phone,
  }) async {
    const serviceId = 'i-multiplexer-468922-m4';
    const templateId = 'template_w41nuh9';
    const publicKey = 'QPe6Uz7Dt0lmP2IRm';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': publicKey,
        'template_params': {
          'user_name': phone,
          'user_email': sender,
          'user_message': message,
        }
      }),
    );

    print("${response.statusCode}----------${response.body}");
    // if (response.statusCode == 200) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('✅ Email sent successfully!')),
    //   );
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('❌ Failed to send email: ${response.body}')),
    //   );
    // }
  }
}