import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppAlcoolGasolina extends StatefulWidget {
  const AppAlcoolGasolina({Key? key}) : super(key: key);

  @override
  _AppAlcoolGasolinaState createState() => _AppAlcoolGasolinaState();
}

class _AppAlcoolGasolinaState extends State<AppAlcoolGasolina> {

  TextEditingController _controllerAlcool = new TextEditingController();
  TextEditingController _controllerGasolina = new TextEditingController();

  String _status = "";

  void _calcularPreco(){

    double valorAlcool = double.parse(_controllerAlcool.text);
    double valorGasolina = double.parse(_controllerGasolina.text);

    double melhorPreco = valorAlcool/valorGasolina;

    _limparCampos();
    if((valorGasolina == null) || (valorAlcool == null)){
      this.setState(() {
        _status = "Digite um valor de Alcool ou Gasolina válidos";
      });
    }
    else if(melhorPreco >= 0.7){
      this.setState(() {
        _status = "Abasteça com Gasolina";
      });
    }
    else{
      this.setState(() {
        _status = "Abasteça com Álcool";
      });
    }
  }

  void _limparCampos(){
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.asset("imagens/logo.png"),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu carro",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Alcool ex: 1.59",
                  ),
                  controller: _controllerAlcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço Gasolina ex: 3.15"),
                  controller: _controllerGasolina,
                ),
                ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: double.infinity, height: null),
                    child: ElevatedButton(
                      onPressed: _calcularPreco,
                      child: Text("Calcular"),
                    )),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(_status
                    ,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
