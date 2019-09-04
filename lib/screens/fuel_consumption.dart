import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_flutter/screens/shared/navigationButton.dart';

class FuelConsumption extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuelState();
}

class _FuelState extends State<FuelConsumption> {
  String result = '';
  final _currencies = ['Dollars', 'Euro', 'Pounds'];
  String _currency = 'Dollars';

  TextEditingController distanceController = TextEditingController();
  TextEditingController consumptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  final double _formDistance = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fuel Consumption App"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
                bottom: _formDistance,
              ),
              child: distanceTextField(),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
                bottom: _formDistance,
              ),
              child: consumptionTextField(),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
                bottom: _formDistance,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: priceTextField(),
                  ),
                  Container(width: _formDistance * 5),
                  Expanded(
                    child: myDropDown(),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 30.0),
            //   child: myDropDown(),
            // ),
            Row(
              children: <Widget>[
                Expanded(
                  child: submitButton(),
                ),
                Container(width: _formDistance * 5),
                Expanded(
                  child: resetButton(),
                ),
              ],
            ),
            Text(result),
            GoBackHome(),
          ],
        ),
      ),
    );
  }

  DropdownButton<String> myDropDown() {
    return DropdownButton<String>(
      items: _currencies.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: _currency,
      onChanged: (String value) {
        _onDropDownChanged(value);
      },
    );
  }

  void _onDropDownChanged(String value) {
    setState(() {
      this._currency = value;
    });
  }

  TextField distanceTextField() {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return TextField(
      controller: distanceController,
      decoration: InputDecoration(
        labelText: 'Distance',
        hintText: 'e.g. 123',
        labelStyle: textStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }

  TextField consumptionTextField() {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return TextField(
      controller: consumptionController,
      decoration: InputDecoration(
        labelText: 'Distance per unit',
        hintText: 'e.g. 12',
        labelStyle: textStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }

  TextField priceTextField() {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return TextField(
      controller: priceController,
      decoration: InputDecoration(
        labelText: 'Price',
        hintText: 'e.g. 12.3',
        labelStyle: textStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }

  RaisedButton submitButton() {
    return RaisedButton(
      color: Theme.of(context).primaryColorDark,
      textColor: Theme.of(context).primaryColorLight,
      onPressed: () {
        setState(() {
          result = _calculate();
        });
      },
      child: Text(
        'Submit',
        textScaleFactor: 1.5,
      ),
    );
  }

  RaisedButton resetButton() {
    return RaisedButton(
      color: Theme.of(context).buttonColor,
      textColor: Theme.of(context).primaryColorDark,
      onPressed: () {
        setState(() {
          _reset();
        });
      },
      child: Text(
        'Reset',
        textScaleFactor: 1.5,
      ),
    );
  }

  String _calculate() {
    double distance = double.parse(distanceController.text);
    double consuption = double.parse(consumptionController.text);
    double price = double.parse(priceController.text);
    double total = distance / consuption * price;
    return result =
        'The total cost is ' + total.toStringAsFixed(2) + ' ' + _currency;
  }

  void _reset() {
    distanceController.text = '';
    consumptionController.text = '';
    priceController.text = '';
    setState(() {
      result = '';
    });
  }
}

