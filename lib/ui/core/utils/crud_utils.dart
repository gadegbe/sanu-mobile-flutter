import 'package:flutter/material.dart';
import 'package:sanu/l10n/l10n.dart';

abstract class CRUDUtils {
  static void deleteConfirmation(BuildContext context, {required VoidCallback onConfirm}) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.l10n.deleteConfirmationTitle),
          content: Text(context.l10n.deleteConfirmationDescription),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(context.l10n.cancel),
            ),
            TextButton(
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop();
              },
              child: Text(context.l10n.delete),
            ),
          ],
        );
      },
    );
  }
}
