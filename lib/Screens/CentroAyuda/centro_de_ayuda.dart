import 'package:blue_car/Screens/Perfil/profile_screen.dart';
import 'package:flutter/material.dart';

class MyData {
  String _title, _body;
  bool _expanded;

  MyData(this._title, this._body, this._expanded);

  @override
  String toString() {
    return 'MyData{_title: $_title, _body: $_body, _expanded: $_expanded}';
  }

  bool get expanded => _expanded;

  set expanded(bool value) {
    _expanded = value;
  }

  get body => _body;

  set body(value) {
    _body = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}

class CentroAyuda extends StatefulWidget{

  @override
    _CentroAyudaState createState() => _CentroAyudaState();
}

class _CentroAyudaState extends State<CentroAyuda>{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Centro de Ayuda",
      theme: new ThemeData.light(),
      home: new HomeWidget()
    );
  }
}
class HomeWidget extends StatefulWidget{
  @override
  _HomeWidgetState createState() => new _HomeWidgetState([
    MyData("Terminos y condiciones", "Bienvenido a las condiciones de bluecar", false),
    MyData("Ayuda", "Aqui podemos ayudarte", false),
  ]);
}

class _HomeWidgetState extends State<HomeWidget>{
  List<MyData> _list;
  _HomeWidgetState(this._list);
  _onExpansion(int index, bool isExpanded)
  {
    setState(() {
      _list[index].expanded = !(_list[index].expanded);
    });
  }
  @override
  Widget build(BuildContext context) {
    List<ExpansionPanel> myList = [];
    for (int i=0, ii = _list.length; i < ii;i++){
      var expansionData = _list[i];
      myList.add(ExpansionPanel(headerBuilder: (BuildContext context, bool isExpanded){
        return  Padding(
            padding: EdgeInsets.all((20.0)),
          child: Text(expansionData._title,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)));
      },
        body: Padding(padding: EdgeInsets.all(20.0),
            child: Text(expansionData._body,
            style: TextStyle(fontSize: 15.0, fontStyle: FontStyle.italic))),
      isExpanded: expansionData._expanded));
    }
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Centro de Ayuda"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          child: new ExpansionPanelList(
            children: myList, expansionCallback: _onExpansion),
        )
      )
    );
  }
}



