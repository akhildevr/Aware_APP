import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockReport extends StatefulWidget {
  @override
  _StockReportState createState() => _StockReportState();
}

class _StockReportState extends State<StockReport> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("#Principal Name"),
        ),
        body: Form(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      // final SnackBar = SnackBar(content: Text(Prinname[index]));
                      // Scaffold.of(context).showSnackBar(snackBar);
                    },
                    title: Text("ProdCode       #prodName       #Modelno ",
                        style: TextStyle(fontSize: 20), maxLines: 3),
                    subtitle: Text(
                      "#stkavl      #PUOM     #STK_LUOM_QTY    #LUOM",
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
