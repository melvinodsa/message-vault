import 'package:flutter/material.dart';
import 'package:myVault/models/category.dart';

class CategoryItem extends StatefulWidget {
  final Category category;
  CategoryItem({Key key, this.category}) : super(key: key);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
      child: Chip(
        backgroundColor: Colors.blue.shade400,
        labelStyle: TextStyle(color: Colors.white),
        label: Text(widget.category.name),
      ),
    );
  }
}
