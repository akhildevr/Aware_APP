import 'package:aware_app/pages/stockreport.dart';
import 'package:flutter/material.dart';
import 'principal_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class principleList extends StatefulWidget {
  @override
  _principleListState createState() => _principleListState();
}

class _principleListState extends State<principleList> {
  // @override
  // void initState() {
  //   fetchDatas().then((value) {
  //     setState(() {
  //       _datas.addAll(value);
  //       _datasForDisplay = _datas;
  //     });
  //   });
  //   super.initState();
  // }

  List<PrincipleValues> _datas = List<PrincipleValues>();
  List<PrincipleValues> _datasForDisplay = List<PrincipleValues>();

  Future<List<PrincipleValues>> fetchDatas() async {
    var url = ' ';
    var response = await http.get(url);

    var datas = List<PrincipleValues>();
    if (response.statusCode == 200) {
      Object datasJson = json.decode(response.body.substring(0));
      for (var dataJson in datasJson) {
        datas.add(PrincipleValues.fromJson(dataJson));
      }
    }
    return datas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Principal List',
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
        )),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return index == 0 ? _searchBar() : _listItem(index - 1);
          },
          itemCount: _datasForDisplay.length + 1,
        ));
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(hintText: 'Search...'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _datasForDisplay = _datas.where((data) {
              var dataCountry = data.pname.toLowerCase();
              return dataCountry.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    String pcode = _datasForDisplay[index].pcode;
    String pname = _datasForDisplay[index].pname;

    return Card(
      child: ListTile(
        title: Text(
          _datasForDisplay[index].pname,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          _datasForDisplay[index].pcode,
          style: TextStyle(color: Colors.deepOrange.shade700),
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: Colors.green,
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StockReport()));
        },
      ),
    );
  }
}
