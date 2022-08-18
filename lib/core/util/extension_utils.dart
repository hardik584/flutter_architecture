import 'dart:convert';
import 'dart:io';

const wEmailRegex =
    "^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+";
const minPasswordLength = 6;

extension StringEmailValidation on String {
  bool isValidEmail() {
    return StringEmptyValidation(this).hasValidData() &&
        RegExp(wEmailRegex).hasMatch(this);
  }

  bool isValidPassword() {
    return StringEmptyValidation(this).hasValidData() &&
        trim().length >= minPasswordLength;
  }
}

extension ListEmptyValidation on List<dynamic> {
  bool hasData() {
    return isNotEmpty;
  }
}

extension StringEmptyValidation on String {
  bool hasValidData() {
    return trim().isNotEmpty;
  }
}

extension FileSizeDoubleUtils on double {
  String getFileSizeInMB({int precisionCount = 2}) {
    return (this / (1024 * 1024)).toStringAsFixed(precisionCount);
  }

  String getFileSizeInMBWithTag({int precisionCount = 2}) {
    return '${FileSizeDoubleUtils(this).getFileSizeInMB()} MB';
  }
}

extension FileSizeIntUtils on int {
  String getFileSizeInMB({int precisionCount = 2}) {
    return (this / (1024 * 1024)).toStringAsFixed(precisionCount);
  }

  String getFileSizeInMBWithTag({int precisionCount = 2}) {
    return '${FileSizeIntUtils(this).getFileSizeInMB()} MB';
  }
}

extension FileConversionUtils on File {
  Future<List<int>> getBytesData() async {
    List<int> fileBytes = await readAsBytes();
    return fileBytes;
  }

  Future<String> getBase64Data() async {
    List<int> imageBytes = await readAsBytes();
    return base64.encode(imageBytes);
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
