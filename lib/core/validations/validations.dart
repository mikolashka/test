import 'package:devtools_test/core/validations/reg_exp.dart';

class Validations{
  static String? validationEmail(String? value){
    if (value == null || value.trim().isEmpty) {
      return 'Заполните поле';
    }

    if (!RegExps.email.hasMatch(value)) {
      return 'Введите корректный email';
    }

    return null;
  }

  static String? validationPassword(String? value){
    if ( value== null || value.trim().isEmpty) {
      return 'Заполните поле';
    }

    if (value.trim().length<6) {
      return 'Пароль должен содержать не менее 6 символов';
    }

    return null;
  }
}