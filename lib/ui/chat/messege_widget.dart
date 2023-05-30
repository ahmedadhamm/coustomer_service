import 'package:flutter/material.dart';

import '../../Utils/utils_data.dart';
import '../../model/message.dart';
import '../../shared_data.dart';

class MassageWidget extends StatelessWidget {
  Message message;

  MassageWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return message.senderId == SharedData.user?.id
        ? SentMessage(message.content!, message.dataTime!)
        : ReceivedMessage(
            message.content!, message.dataTime!, message.senderName!);
  }
}

class SentMessage extends StatelessWidget {
  int dataTime;
  String content;

  SentMessage(this.content, this.dataTime, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
                bottomLeft: Radius.circular(24),
                // bottomRight: Radius.circular(24),
              )),
          child: Text(
            content,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Text(
          formatMessageData(dataTime),
        ),
        //Text('${formatMessageData(dataTime)}'),
      ],
    );
  }
}

class ReceivedMessage extends StatelessWidget {
  String senderName;
  int dataTime;
  String content;

  ReceivedMessage(this.content, this.dataTime, this.senderName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(senderName),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
                bottomLeft: Radius.circular(24),
                // bottomRight: Radius.circular(24),
              )),
          child: Text(
            content,
            style: const TextStyle(
              color: Color(0xFF787993),
            ),
          ),
        ),
        Text(formatMessageData(dataTime)),
      ],
    );
  }
}
