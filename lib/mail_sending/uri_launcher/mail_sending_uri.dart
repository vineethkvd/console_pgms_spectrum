import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MailSendingUri extends StatefulWidget {
  const MailSendingUri({super.key});

  @override
  State<MailSendingUri> createState() => _MailSendingUriState();
}

class _MailSendingUriState extends State<MailSendingUri> {
  openGmailApp() async {
    String email = 'akashvs64731@gmail.com';
    String subject = 'This is a test email';
    String body = 'This is a test email body';
    String emailUrl = "mailto:$email?subject=$subject&body=$body";
    await launchUrl(Uri.parse(emailUrl));
    setState(() {
      hasSentMail = !hasSentMail;
    });
  }

  bool hasSentMail = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mail sending"),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  openGmailApp();
                  hasSentMail = true;
                });
              },
              child: Text(hasSentMail ? 'Open Mail...' : 'Opening'))
        ],
      )),
    );
  }
}
