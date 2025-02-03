import 'package:arobaze/utils/cache.dart';
import 'package:flutter/material.dart';

class MessageTab extends StatefulWidget {
  const MessageTab({super.key});

  @override
  State<MessageTab> createState() => _MessageTabState();
}

class _MessageTabState extends State<MessageTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getGlobalState(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            /* child: SvgPicture.asset(
              !snapshot.data! ? 'assets/images/placeholders/messages/message_good.svg' : 'assets/images/placeholders/messages/message_bad.svg',
              semanticsLabel: 'Daniel',
              /* height: MediaQuery.of(context).size.width * 0.7, */
              width: MediaQuery.of(context).size.width * 0.9,
            ), */
            child: Image.asset(
              !snapshot.data! ? 'assets/images/placeholders/messages/message_good.png' : 'assets/images/placeholders/messages/message_bad.png',
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      }
    );
  }
}