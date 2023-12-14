import 'dart:developer';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class OtherScreen extends StatefulWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  State<OtherScreen> createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Other Screen')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final dynamicLinkParams = DynamicLinkParameters(
            link: Uri.parse("https://quikrads.page.link/shareHotel"),
            uriPrefix: "https://deplinking.page.link",
            androidParameters:
                const AndroidParameters(packageName: "com.example.dep_linking"),
            iosParameters:
                const IOSParameters(bundleId: "com.example.depLinking"),
          );
          final dynamicLink = await FirebaseDynamicLinks.instance
              .buildShortLink(dynamicLinkParams);
          String? link = dynamicLink.shortUrl.toString();
          log(link.toString());
          Share.share(link);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.share),
      ),
    );
  }
}
