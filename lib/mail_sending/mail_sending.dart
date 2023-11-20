import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class MailSendingSample extends StatefulWidget {
  const MailSendingSample({super.key});

  @override
  State<MailSendingSample> createState() => _MailSendingSampleState();
}

class _MailSendingSampleState extends State<MailSendingSample> {
  void Mailer() async {
    String username = 'vineethvenu2023@gmail.com';
    String password = 'vipin@199710';

    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Your name')
      ..recipients.add('vineethvenu1997@gmail.com')
      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
    setState(() {
      hasSentMail = !hasSentMail;
    });
  }

  bool hasSentMail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: Column(children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                hasSentMail = true;
              });
              Mailer();
            },
            child: Text(hasSentMail ? 'Sending...' : 'Send Mail'))
      ])),
    );
  }
}
