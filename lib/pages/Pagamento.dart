import 'package:flutter/material.dart';

class Pagamento extends StatefulWidget {
  const Pagamento({Key? key}) : super(key: key);

  @override
  State<Pagamento> createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(),
      body: buildBody(),
    );
  }

  buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Container(
            child: Column(
              children: const [
                Icon(Icons.shopping_cart),
                Text('Forma de Pagamento'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
