
class EmailValidator{

  String email;

  bool get isValid => email.length > 3 && email.contains('@') ? true : false;

  EmailValidator(this.email);
}

class PasswordValidator{

  String password;

  bool get isValid => password.length > 8 ? true : false;

  PasswordValidator(this.password);
}
