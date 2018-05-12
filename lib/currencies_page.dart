import 'package:cached_network_image/cached_network_image.dart';
import 'package:currencyobserverflutter/data/currency_data.dart';
import 'package:currencyobserverflutter/modules/currency_presenter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyPage extends StatefulWidget {
  @override
  _CurrencyPageState createState() => new _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> implements CurrencyListViewContract {
  CurrencyListPresenter _presenter;
  List<CurrencyData> _currencies;
  bool _isLoading;

  _CurrencyPageState() {
    _presenter = new CurrencyListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Currency'),
          elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
        ),
        body: _isLoading
            ? new Center(
          child: new CircularProgressIndicator(),
        )
            : _currencyWidget());
  }

  Widget _currencyWidget() {
    return new Container(
        child: new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                itemCount: _currencies.length,
                itemBuilder: (BuildContext context, int index) {
                  final CurrencyData currency = _currencies[index];

                  return _getListItemUi(currency);
                },
              ),
            )
          ],
        ));
  }

  ListTile _getListItemUi(CurrencyData currency) {
    return new ListTile(
      leading: new CachedNetworkImage(
        placeholder: new Icon(Icons.attach_money),
        imageUrl: currency.getImageUrl(),
      ),
      title: new Text(currency.getText(), style: new TextStyle(fontWeight: FontWeight.bold)),
    );
  }



  @override
  void onLoadCurrencyComplete(List<CurrencyData> items) {
    setState(() {
      _currencies = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadCurrencyError() {
  }

}