import 'package:flutter/material.dart';
import 'package:flutter_db/database.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  List<Map<String,dynamic>> rr;
  final dbhelp=dbhelper.instance;

  void insertdata() async{
    Map<String,dynamic> row={dbhelper.columnname:"hello",
    dbhelper.columnage:19};
    final id = await dbhelp.insert(row);
    print(id);
  }
  void deletedata(int id)async{
    var i = await dbhelp.delete(id);

  }
  searchalldata()async{
     List<Map<String,dynamic>> i = await dbhelp.alldata();
    setState(() {
      rr=i;

    });
    print(i);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GestureDetector(
onTap: ()=> insertdata(),
            child: ListTile(
              title: Text("insert"),
            ),
          ),
         GestureDetector(
            onTap:()=>
            searchalldata()
            ,
            child: ListTile(
              title: Text("seedata"),
            ),
          )
        ],
      ),
    );
  }
}

