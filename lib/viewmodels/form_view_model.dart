abstract class FormViewModel{

  Sink get inputEmailText;
  Sink get inputPasswordText;
  Stream<bool> get outputErrorEmail;
  Stream<bool> get outputErrorPassword;
  Stream<String> get outputErrorEmailText;
  Stream<String> get outputErrorPasswordText;
}