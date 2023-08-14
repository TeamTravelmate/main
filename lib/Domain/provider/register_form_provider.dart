import 'package:flutter/material.dart';
import 'package:main/Data/storage/register_form_data.dart';

class RegistrationFormProvider extends ChangeNotifier {
  RegistrationFormData formData = RegistrationFormData();
  String get firstName => formData.firstName;
  String get lastName => formData.lastName;
  DateTime get birthday => formData.birthday;
  


  void updateFirstName(String value) {
    formData.firstName = value.trim();
    notifyListeners();
  }

  void updateLastName(String value) {
    formData.lastName = value.trim();
    notifyListeners();
  }

  bool validateNameForm() {
    if (formData.firstName.isEmpty || formData.lastName.isEmpty) {
      return false;
    }
    return true;
  }

  void updateBirthday(DateTime value) {
    formData.birthday = value;
    notifyListeners();
  }

  void updateGender(String value) {
    formData.gender = value.trim();
    notifyListeners();
  }

  void updateUsername(String value) {
    formData.username = value.trim();
    notifyListeners();
  }

  void updateEmail(String value) {
    formData.email = value.trim();
    notifyListeners();
  }

  void updateConfirmEmail(String value) {
    formData.confirmEmail = value.trim();
    notifyListeners();
  }

  void updatePhoneNo(String value) {
    formData.phoneNo = value.trim();
    notifyListeners();
  }

  void updatePassword(String value) {
    formData.password = value.trim();
    notifyListeners();
  }

  void updateConfirmPassword(String value) {
    formData.confirmPassword = value.trim();
    notifyListeners();
  }
}
