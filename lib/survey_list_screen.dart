import 'package:flutter/material.dart';
import 'survey_screen.dart';
import 'globals.dart';

class SurveyListScreen extends StatefulWidget {
  @override
  _SurveyListScreenState createState() => _SurveyListScreenState();
}

class _SurveyListScreenState extends State<SurveyListScreen> {

  final List<String> surveyNames = [
    '1.- Encuesta de Satisfacción del Semestre',
    '2.- Encuesta de Satisfacción del Servicio de Comedor',
    '3.- Encuesta de Actividades Extracurriculares',
    '4.- Encuesta de Instalaciones Deportivas',
    '5.- Encuesta de Recursos Tecnológicos'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Encuestas'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: surveyNames.length,
        separatorBuilder: (context, index) => Divider(height: 1),
        itemBuilder: (context, index) {
          bool isCompleted = completedSurveys[index];
          return ListTile(
            leading: Icon(isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isCompleted ? Colors.green : Colors.grey),
            title: Text(
              surveyNames[index],
              style: TextStyle(
                color: isCompleted ? Colors.grey : Colors.black, 
                decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none, 
              ),
            ),
            tileColor: isCompleted ? Colors.green[50] : null, 
            onTap: isCompleted ? null : () { 
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SurveyScreen(surveyIndex: index),
                ),
              ).then((_) => setState(() {}));
            },
          );
        },
      ),
    );
  }
}
