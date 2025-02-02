import 'package:flutter/material.dart';
import 'package:sanu/l10n/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  String get email => 'patricegadegbe@thecodingfinger.com';

  String get phone => '+33';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Contact'),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.email),
            const SizedBox(width: 8),
            InkWell(
              onTap: () => launchUrl(Uri.parse('mailto:$email')),
              child: Text(
                email,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.phone),
            const SizedBox(width: 8),
            InkWell(
              onTap: () => launchUrl(Uri.parse('tel:$phone')),
              child: Text(
                phone,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            launchUrl(
              Uri.parse(''),
            );
          },
          child: Text(
            context.l10n.privacyPolicy,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
