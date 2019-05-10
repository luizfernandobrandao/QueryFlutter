import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
 
final notesReference = FirebaseDatabase.instance.reference().child('produtos');


class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => new _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final myControllerTit = TextEditingController();
  final myControllerDes = TextEditingController();
  final myControllerPrec = TextEditingController();

  @override
  void dispose() {
  // Clean up the controller when the Widget is disposed
  myControllerTit.dispose();
  myControllerDes.dispose();
  myControllerPrec.dispose();
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final titulo = TextField(
      controller: myControllerTit,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Título",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final descricao = TextField(
      controller: myControllerDes,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Descrição",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final preco = TextField(
      controller: myControllerPrec,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Preço",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final criarAnuncio = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          notesReference.push().set({
            'titulo': myControllerTit.text,
            'descricao': myControllerDes.text,
            'preco': myControllerPrec.text,
        });
        },
        child: Text("Anunciar",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Criar Anúncio'),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 45.0),
                titulo,
                SizedBox(height: 45.0),
                descricao,
                SizedBox(height: 45.0),
                preco,
                SizedBox(height: 45.0),
                criarAnuncio        
              ],
            ),
          ),
        ),
      ),
    );
  }
}