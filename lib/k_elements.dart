import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class KElements extends StatefulWidget {
  final String n;

  const KElements({Key key, this.n}) : super(key: key);
  @override
  _KElementsState createState() => _KElementsState();
}

class _KElementsState extends State<KElements> {
  TextEditingController kElementsController = TextEditingController();
  List<String> saida = [];
  List<int> saidafinal = [];
  List<int> saidaAux = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('K elements'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: kElementsController,
                  decoration: InputDecoration(
                    hintText: 'Ex: 1 2 3 4 5 6 7 8 9',
                    labelText:
                        'insira ${widget.n} numeros separados por espaço',
                    labelStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text(
                'Resultado',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                saidafinal.clear();

                setState(() {
                  saida = kElementsController.text.split(' ');
                  saida.forEach((element) {
                    if (isInt(element)) {
                      int x = int.parse(element);

                      if (!saidafinal.contains(x)) {
                        saidafinal.add(int.parse(element));
                      }
                    }
                  });
                  saidafinal.sort();
                });
              },
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: saidafinal.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(saidafinal[index].toString()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
