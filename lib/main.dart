import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light
      )
  );
  runApp(
      MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
      )
  );
}


class Home extends StatefulWidget {
@override
_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _fraseAtual = 0;
    //se a ultima frase chamada for igual a atual, ele chama novamente
  final _frasesTotal = const [
  {
    'frase': 'O ciumento passa a vida a procurar um segredo cuja descoberta lhe destruiria a felicidade.',
    'autor': '- Axel Oxenstiern',
  },
  {
    'frase': 'Se um homem não descobriu nada pelo qual morreria, não está pronto para viver.',
    'autor': '- Martin Luther King',
  },
  {
    'frase': "Não espere por uma crise para descobrir o que é importante em sua vida.",
    'autor': '- Platão',
  },
  {
    'frase': 'Ocupados em descobrir os defeitos alheios, esquecemo-nos de investigar os próprios.',
    'autor': '- Marquês de Maricá'
  },
  {
    'frase': 'Se fiz descobertas valiosas, foi mais por ter paciência do que qualquer outro talento.',
    'autor': '- Isaac Newton'
  }
];
//List _frases = [
//'O ciumento passa a vida a procurar um segredo cuja descoberta lhe destruiria a felicidade.',
//'Se um homem não descobriu nada pelo qual morreria, não está pronto para viver.',
//'Não espere por uma crise para descobrir o que é importante em sua vida.',
//  'Ocupados em descobrir os defeitos alheios, esquecemo-nos de investigar os próprios.'
//];

  var _fraseGerada = 'Clique abaixo para gerar uma nova frase!';


  void _GeraFrase(){
  setState(() {
    _fraseAtual = Random().nextInt(_frasesTotal.length);
    _fraseGerada = _frasesTotal[_fraseAtual]['frase'];
  });
  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
      child: Container(
        padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset("images/logo.png"),
          Text(
          _fraseGerada,
          textAlign: TextAlign.justify,
            style: TextStyle(
            fontSize: 17,
            fontStyle: FontStyle.italic,
            color: Colors.black
          ),
        ),
          if(_fraseGerada != 'Clique abaixo para gerar uma nova frase!')
            Text(_frasesTotal[_fraseAtual]['autor']),
          RaisedButton(
            child: Text(
            "Nova frase",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
            onPressed: (){
              _GeraFrase();
            },
          color: Colors.green,
          )
      ],
  ),
  ),
  ),
  );
  }
  }
