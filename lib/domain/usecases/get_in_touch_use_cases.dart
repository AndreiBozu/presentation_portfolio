import 'package:presentation_portfolio/core/constant.dart';
import 'package:presentation_portfolio/data/models/get_in_touch_form_model.dart';


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

  }
}