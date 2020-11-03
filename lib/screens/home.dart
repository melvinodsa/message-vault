import 'package:flutter/material.dart';
import 'package:myVault/components/category_item.dart';
import 'package:myVault/components/message_item.dart';
import 'package:myVault/constants/texts.dart';
import 'package:myVault/models/category.dart';
import 'package:myVault/models/message.dart';
import 'package:myVault/services/message.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Message> messageItems = new List<Message>();
  List<Category> categoryItems = new List<Category>();

  @override
  void initState() {
    super.initState();
    loadCategoriesAndMessages();
  }

  void loadCategoriesAndMessages() async {
    var messageService = new MessageService();
    var categoryItems = messageService.getCategories();
    var messageItems = messageService.getMessages(null);
    categoryItems.then((value) => {setState(() => this.categoryItems = value)});
    messageItems.then((value) => {setState(() => this.messageItems = value)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          topBar(context),
          categories(context, categoryItems),
          messages(context, messageItems),
        ],
      ),
    ));
  }

  Container topBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppName,
                  style: TextStyle(color: Colors.black, fontSize: 30)),
              Text('Last synced on Aug 17th',
                  style: TextStyle(color: Colors.black, fontSize: 15)),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.search_rounded,
              size: 40,
            ),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }

  Container messages(BuildContext context, List<Message> messages) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
          color: Colors.grey.shade400,
          child: Column(
            children: messages
                .map((Message message) => MessageItem(message: message))
                .toList(),
          ),
        ),
      ),
    );
  }

  Container categories(BuildContext context, List<Category> categories) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories
                .map((Category category) => CategoryItem(category: category))
                .toList(),
          ),
        ));
  }
}
