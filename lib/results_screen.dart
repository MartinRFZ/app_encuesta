import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> answers;

  ResultsScreen({Key? key, required this.answers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados de las Encuestas'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true, 
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(8.0),
        itemCount: answers.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: ListTile(
              leading: Icon(Icons.check_circle_outline, color: Colors.green),
              title: Text(
                'Respuesta ${index + 1}: ${answers[index]}',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              tileColor: Colors.white,
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(height: 0.5),
      ),
    );
  }
}
