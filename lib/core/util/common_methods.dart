import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

showSnackBar({required BuildContext context, required String value}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      value,
      style: const TextStyle(
          color: Colors.white),
    ),
    behavior: SnackBarBehavior.floating,
  ));
}
