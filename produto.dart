import 'package:firebase_database/firebase_database.dart';

class Produto {
  final String key;
  String titulo;

  Produto.fromJson(this.key, Map data) {
    titulo = data['titulo'];
    if (titulo == null) {
      titulo = 'nada';
    }
  }
}
