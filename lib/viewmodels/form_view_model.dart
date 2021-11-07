abstract class FormViewModel{

  Sink get inputEmailText;
  Sink get inputPasswordText;
  Stream<bool> get outputError;
  Stream<String> get outputErrorEmailText;
  Stream<String> get outputErrorPasswordText;

  void dispose();
}