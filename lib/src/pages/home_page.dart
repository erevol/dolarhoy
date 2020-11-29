import 'package:dolarhoy/src/providers/rates_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final ratesProvider = new RatesProvider();
  final green = Color.fromRGBO(39, 174, 96, 1.0);
  final greenLight = Color.fromRGBO(46, 204, 113, 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: SafeArea(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _renderHeading(),
                    Text(
                      'Oficial',
                      style: TextStyle(
                        color: green,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _renderCard(0),
                    Text(
                      'Blue',
                      style: TextStyle(
                        color: green,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _renderCard(1),
                    _renderFooter(),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  gradient: LinearGradient(colors: [
                    Colors.grey.shade100,
                    Colors.grey.shade200,
                  ])),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderHeading() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40.0),
        child: Text(
          'DOLAR HOY',
          style: TextStyle(
              color: green,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 60.0),
        ),
      ),
    );
  }

  Widget _renderFooter() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40.0),
        child: Text(
          'Valores tomados de ambito.com',
          style: TextStyle(color: green, fontSize: 14.0),
        ),
      ),
    );
  }

  Widget _renderCard(int dollarIndex) {
    return FutureBuilder(
      future: ratesProvider.getData(dollarIndex),
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                gradient: LinearGradient(colors: [
                  greenLight,
                  green,
                ])),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      Text('Venta', style: _styledHeading()),
                      Text(snapshot.hasData ? snapshot.data.buy : '0,00',
                          style: _styledSubHeading()),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Compra', style: _styledHeading()),
                      Text(snapshot.hasData ? snapshot.data.sell : '0,00',
                          style: _styledSubHeading()),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          snapshot.hasData
                              ? (snapshot.data.classVariation == 'up'
                                  ? Icon(
                                      Icons.arrow_drop_up,
                                      color: Colors.green[200],
                                    )
                                  : Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.red[200],
                                    ))
                              : Text(
                                  '-',
                                  style: _styledVariation(),
                                ),
                          Text(snapshot.hasData ? snapshot.data.variation : '-',
                              style: _styledVariation()),
                        ],
                      ),
                      Text(snapshot.hasData ? snapshot.data.date : '-',
                          style: _styledDate()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  TextStyle _styledHeading() {
    return TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _styledSubHeading() {
    return TextStyle(
      color: Colors.white,
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _styledVariation() {
    return TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _styledDate() {
    return TextStyle(
      color: Colors.white,
      fontSize: 10.0,
    );
  }
}
