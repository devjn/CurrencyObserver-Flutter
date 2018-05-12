import 'package:currencyobserverflutter/currencies_page.dart';
import 'package:currencyobserverflutter/cryptocurrency_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => new _BottomState();
}

class _BottomState extends State<Bottom> with SingleTickerProviderStateMixin {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Offstage(
              offstage: index != 0,
              child: new TickerMode(
                enabled: index == 0,
                child: new MaterialApp(home: new CurrencyPage()),
              ),
            ),
            new Offstage(
              offstage: index != 1,
              child: new TickerMode(
                enabled: index == 1,
                child: new MaterialApp(home: new CryptocurrencyPage()),
              ),
            ),
          ],
        ),
        bottomNavigationBar: new BottomNavigationBar(
          currentIndex: index,
          onTap: (int index) { setState((){ this.index = index; }); },
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(icon: new Icon(Icons.attach_money), title: new Text("Currency"), backgroundColor: Colors.cyan),
            new BottomNavigationBarItem(icon: new Icon(FontAwesomeIcons.bitcoin), title: new Text("Cryptocurrency"), backgroundColor: Colors.lightGreen),
          ],
        )
    ); //scaffold
  }
}