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
}