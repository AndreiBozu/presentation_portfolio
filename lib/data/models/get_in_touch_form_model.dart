class GetInTouchFormModel {
  final String email;
  final String phone;
  final String message;
  const GetInTouchFormModel({required this.email, this.phone = "", required this.message});
}

class GetInTouchFormValidationResponse {
  final bool isSuccess;
  final String message;
  final bool isEmailError;
  final bool isMessageError;
  const GetInTouchFormValidationResponse({
    required this.isSuccess,
    required this.message,
    this.isEmailError = false,
    this.isMessageError = false
  });
}