class ValidationMixin {
  bool isFieldEmpty(String fieldValue) => fieldValue.isEmpty;

  bool validatePhoneNumber(String? phNo) {
    if (phNo == null) {
      return false;
    }
    return RegExp(r'^(?:[+0]9)?[0-9]{6,14}$').hasMatch(phNo);
  }

  bool passwordValidation(String? email) {
    if (email == null) {
      return false;
    }

    return RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
        .hasMatch(email);
  }

  bool confirmPasswordValidation(String password, String confirmPwd) {
    return (password != confirmPwd);
  }

  bool isChecked(bool value) {
    return value ? false : true;
  }

  bool checkCity(List cityNames, String name) {
    return cityNames.contains(name);
  }

  bool otpValidation(String? otp) {
    if (otp == null) {
      return false;
    }

    if (otp.length > 4) {
      return false;
    }

    return true;
  }

  bool codeValidation(String? code) {
    if (code == null) {
      return false;
    }

    if (code.length > 6) {
      return false;
    }

    return true;
  }

  bool screenNameValidation(String screenName) {
    if (screenName.length < 5 || screenName.length > 20) {
      return false;
    }
    return true;
  }
}
