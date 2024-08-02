import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import 'package:flutter_plugin_openwhatsapp/flutter_plugin_openwhatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomButtons extends StatelessWidget {
  final String phoneNumber;  // Include country code but without '+', e.g., '15551234567' for US

  const BottomButtons({super.key, required this.phoneNumber});

  Future<void> _makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  Future<void> _sendMessage() async {
    final flutterPlugin = FlutterPluginOpenwhatsapp();
    String? result = await flutterPlugin.openWhatsApp(
      phoneNumber: phoneNumber,
      text: "Hello, I'm interested in your property listing.",
    );
    debugPrint('WhatsApp send result: $result');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: appPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: size.width * 0.4,
            height: 60,
            decoration: BoxDecoration(
                color: darkBlue,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: darkBlue.withOpacity(0.6),
                      offset: const Offset(0, 10),
                      blurRadius: 10)
                ]),
            child: InkWell(
              onTap: _sendMessage,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.message, color: white),
                  SizedBox(width: 8),  // Space between icon and text
                  Text('Message', style: TextStyle(
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
                ],
              ),
            ),
          ),
          Container(
            width: size.width * 0.4,
            height: 60,
            decoration: BoxDecoration(
                color: darkBlue,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: darkBlue.withOpacity(0.6),
                      offset: const Offset(0, 10),
                      blurRadius: 10)
                ]),
            child: InkWell(
              onTap: _makePhoneCall,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call_rounded, color: white),
                  SizedBox(width: 8),  // Space between icon and text
                  Text('Call', style: TextStyle(
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
