import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Cadastro de Pessoas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final txtNome  = TextEditingController();
  final txtIdade = TextEditingController();

  void _salvar() {
    setState(() {
      txtNome.text  = '';
      txtIdade.text = '';
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  TextField(
                    controller: txtNome,
                    decoration: InputDecoration(
                      hintText: 'Nome'
                    ),
                  ),
                  TextField(
                    controller: txtIdade,
                    decoration: InputDecoration(
                      hintText: 'Idade'
                    ),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: GridView.count(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 6,
                children: List.generate(100, (index){
                  return Center(
                    child: Text(
                      'item',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  );
                }),
              ),
            ),
            

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _salvar,
        tooltip: 'Salvar',
        child: Icon(Icons.save),
      ),
    );
  }
}
