import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<String?> showInputDialog(
  BuildContext context, {
  String? title,
  String? initalValue,
}) async {
  String value = initalValue ?? '';

  //final isDarkMode = context.isDarkMode;

  final result = await showCupertinoDialog<String>(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: title != null ? Text(title) : null,
      content: CupertinoTextField(
        controller: TextEditingController()..text = initalValue ?? '',
        style: const TextStyle(color: Colors.black87),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.black12),
        onChanged: (text) {
          value = text;
        },
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context, value);
          },
          isDefaultAction: true,
          child: const Text("SAVE"),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context);
          },
          isDestructiveAction: true,
          child: const Text("CANCEL"),
        )
      ],
    ),
  );

  if (result != null && result.trim().isEmpty) {
    return null;
  }

  return result;
}
