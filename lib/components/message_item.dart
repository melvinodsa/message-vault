import 'package:flutter/material.dart';
import 'package:myVault/models/message.dart';

class MessageItem extends StatefulWidget {
  final Message message;
  MessageItem({Key key, this.message}) : super(key: key);

  @override
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: 75,
      child: Card(child: Text(widget.message.from)),
    );
  }
}
