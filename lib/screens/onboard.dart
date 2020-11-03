import 'package:flutter/material.dart';

import 'package:myVault/constants/texts.dart';
import 'package:myVault/screens/home.dart';

class Onboard extends StatelessWidget {
  const Onboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(AppName,
                style: TextStyle(color: Colors.black, fontSize: 40)),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(20, 100, 20, 100),
              child: Text(AppDescription,
                  style: TextStyle(color: Colors.black, fontSize: 20))),
          RaisedButton(
            textColor: Colors.white,
            color: Colors.blue.shade400,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Text('Proceed'),
          )
        ],
      ),
    ));
  }
}
