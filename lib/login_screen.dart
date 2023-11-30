import 'package:flutter/material.dart';
import 'survey_list_screen.dart';
import 'results_screen.dart';
import 'globals.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsScreen(answers: globalAnswers),
                    ),
                  );
                },
                icon: Icon(Icons.admin_panel_settings, color: Colors.white),
                label: Text('Login como Administrador'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple, 
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SurveyListScreen()),
                  );
                },
                icon: Icon(Icons.person, color: Colors.white),
                label: Text('Login como Encuestado'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
