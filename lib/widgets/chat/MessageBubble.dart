import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final message;
  final isMe;
  final username;

  MessageBubble(this.message, this.isMe, this.username);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: 200,
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 20,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 5,
          ),
          decoration: BoxDecoration(
            color: isMe
                ? Theme.of(context).primaryColor
                : Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isMe
                      ? Theme.of(context).primaryTextTheme.headline6!.color
                      : Theme.of(context).accentTextTheme.headline6!.color,
                  fontSize: 15,
                ),
              ),
              Text(
                message,
                style: TextStyle(
                  color: isMe
                      ? Theme.of(context).primaryTextTheme.headline6!.color
                      : Theme.of(context).accentTextTheme.headline6!.color,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
