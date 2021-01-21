import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice_restoran/model.dart';

class PrintOut extends StatefulWidget {
  final List<Product> _cart;
  TextEditingController kasirNameController = new TextEditingController();

  PrintOut(this._cart, this.kasirNameController);

  @override
  _PrintOutState createState() =>
      _PrintOutState(this._cart, this.kasirNameController);
}

class _PrintOutState extends State<PrintOut> {
  _PrintOutState(this._cart, this.kasirNameController);
  TextEditingController kasirNameController = new TextEditingController();
  static int subTotal;
  DateTime now = DateTime.now();
  String formattedDate =
      DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  List<Product> _cart;

  @override
  Widget build(BuildContext context) {
    print("Warung Makan Sederhana");
    print("Tanggal : ${formattedDate}");
    print("Nama Kasir : ${kasirNameController.text}");
    print("=======================================");
    print("Total : ................................ ${subTotal}");
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: _cart.length,
                itemBuilder: (context, index) {
                  var item = _cart[index];
                  subTotal = _cart.fold(
                      0,
                      (previousValue, element) =>
                          previousValue + _cart[index].prize);
                  print(
                      "${_cart[index].name} ................. ${_cart[index].prize}");
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 2.0),
                    child: Card(
                      elevation: 4.0,
                      child: ListTile(
                        leading: Icon(
                          item.icon,
                          color: item.color,
                        ),
                        title: Column(
                          children: [
                            Text(item.name),
                            Text("Rp. ${item.prize}")
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Card(
            elevation: 4.0,
            child: ListTile(title: Text('Struk Sudah Terkirim')),
          ),
        ],
      ),
    );
  }
}
