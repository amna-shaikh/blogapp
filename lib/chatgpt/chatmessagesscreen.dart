import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'message.dart';

class WidgetChatMessage extends StatelessWidget {
  final String text;
  final ChatMessageType chatMessageType;
  const WidgetChatMessage({required this.text , required this.chatMessageType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(8),
      color: ChatMessageType == ChatMessageType.bot ? Color(0xFF444654): Color(0xFf343541),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
          children : [
            ChatMessageType ==   ChatMessageType.bot ?
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(16, 163, 127, 1),
                    child: Image(image: NetworkImage("")),
                  ),
                ):
            Container(
              margin: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                backgroundColor: Color(0xff444654),
                child: Icon(Icons.person),
              ),
            ),
             Expanded(child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                   margin: EdgeInsets.all(8),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5),
                     
                   ),
                   child: Text(text, style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                     color: Colors.white
                   )),
                 )
               ],
             ))
          ]

      ),
    );
  }
}
