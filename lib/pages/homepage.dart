import 'package:aware_app/pages/principal_list.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu",
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
        ),
        elevation: .1,
        backgroundColor: Color.fromRGBO(59, 87, 110, 1.0),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          //padding: EdgeInsets.all(13.0),
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => principleList()))

                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) {
                  //     return samFile();
                  //   },
                  // ))
                },
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.account_balance_wallet,
                          size: 70.0, color: Colors.red),
                      Text("Stock Report", style: new TextStyle(fontSize: 17))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => principleList()))
                },
                splashColor: Colors.brown,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.assignment,
                          size: 70.0, color: Colors.lightBlue),
                      Text("GRN Report", style: new TextStyle(fontSize: 17))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.red,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.account_balance,
                          size: 70.0, color: Colors.brown),
                      Text("Transaction Report",
                          style: new TextStyle(fontSize: 17))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
