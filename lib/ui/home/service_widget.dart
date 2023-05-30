import 'package:flutter/material.dart';

import '../../model/room.dart';
import '../chat/chat_thread.dart';

class ServiceWidget extends StatelessWidget {
  Room room;

  ServiceWidget(this.room, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ChatThread.routeName, arguments: room);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 18,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/vs-it_computer.png",
                width: 120,
                height: 120,
              ),
              // Image.asset(
              //   "assets/images/${room.catId}.png",
              //   width: 120,
              //   height: 120,
              // ),
              Text(
                '${room.title}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
