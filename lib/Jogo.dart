import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';

class Jogo extends StatefulWidget{
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo>{
  var _imagemApp = AssetImage("assets/padrao.png");
  var _mensagem = "Escolhe uma opção abaixo";

  final Map<String, AssetImage> _opcoesImagem = {
    "pedra" : AssetImage("assets/pedra.png"),
    "papel" : AssetImage("assets/papel.png"),
    "tesoura" : AssetImage("assets/tesoura.png"),
  };

  void _opcaoSelecionar(String escolhaUsuario){
    final opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3); //gerando numero aleatorio entre 0 e 2
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do Usuario: " + escolhaUsuario);

    setState(() {
      this._imagemApp = _opcoesImagem[escolhaApp]!;
    });

    //regra do jogo

    if(
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura")||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel")||
      (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ){
      setState(() {
        this._mensagem = "Parabéns! você ganhou.";
      });
    } else if(escolhaUsuario == escolhaApp){
       setState(() {
        this._mensagem = "Jogo empatado.";
      });
    }
    else{
      setState(() {
        this._mensagem = "você perdeu.";
      });
    }
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jo-Ken-Po",),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,  //centraliza tudo embaixo desta propriedade
        children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top:32,bottom: 16),
          child: Text(
            "Escolha do App",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              ),
            ),  
          ),
          Image(image: this._imagemApp,),
          Padding(padding: EdgeInsets.only(top:32,bottom: 16),
          child: Text(
            this._mensagem,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              ),
            ),  
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionar("pedra"),
                child: Image.asset("assets/pedra.png", height: 100)
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionar("papel"),
                child: Image.asset("assets/papel.png", height: 100)
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionar("tesoura"),
                child: Image.asset("assets/tesoura.png", height: 100)
              ),
            ],
          )
        ],
      ),
    );
  }
}