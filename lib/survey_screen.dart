import 'package:flutter/material.dart';
import 'globals.dart';

class SurveyScreen extends StatefulWidget {
  final int surveyIndex;

  SurveyScreen({Key? key, required this.surveyIndex}) : super(key: key);

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final List<List<String>> surveyQuestions = [
    [
      '1.- ¿Qué te pareció el semestre?',
      '2.- ¿Qué te pareció el criterio de los profesores?',
      '3.- ¿Cómo fue tu desempeño en el semestre?',
      '4.- ¿Cómo fue tu experiencia con la red de la facultad?',
      '5.- ¿Cómo fue tu experiencia con las aulas de la facultad?'
    ],
    [
      '6.- ¿Cómo calificarías la calidad de la comida en el comedor?',
      '7.- ¿Qué opinas sobre la variedad de alimentos ofrecidos?',
      '8.- ¿Cómo evalúas la limpieza y el ambiente del comedor?',
      '9.- ¿Qué te parece el precio de la comida ofrecida?',
      '10.- ¿Cómo calificarías el servicio del personal del comedor?'
    ],
    [
      '11.- ¿Cómo fue tu desarrollo en las actividades extracurriculares este semestre?',
      '12.- ¿Cómo calificarías la diversidad de actividades extracurriculares ofrecidas?',
      '13.- ¿Qué opinas sobre la organización de las actividades extracurriculares?',
      '14.- ¿Cómo fue tu experiencia con los instructores o líderes de las actividades?',
      '15.- ¿Recomendación de actividades extracurriculares por parte de otros estudiantes?'
    ],
    [
      '16.- ¿Tu utilización de las instalaciones deportivas este semestre?',
      '17.- ¿Cómo calificarías el estado de las instalaciones deportivas?',
      '18.- ¿Qué opinas sobre la organización de las actividades extracurriculares?',
      '19.- ¿Cómo evalúas la limpieza y mantenimiento de las instalaciones deportivas?',
      '20.- ¿Qué te parece la variedad de deportes y actividades físicas ofrecidas?'
    ],
    [
      '21.- ¿Cómo calificarías la calidad de los equipos informáticos (computadoras, impresoras, etc.)?',
      '22.- ¿Qué opinas sobre la velocidad y fiabilidad de la conexión a internet?',
      '23.- ¿Cómo evalúas la disponibilidad de software y herramientas digitales para el aprendizaje?',
      '24.- ¿Qué opinas sobre el soporte técnico y la asistencia en problemas informáticos?',
      '25.- ¿Cómo calificarías la formación y capacitación en herramientas digitales ofrecida a los estudiantes?'
    ],
  ];

  final List<List<String>> options = [
    ['Excelente', 'Muy Buena', 'Regular', 'Malo', 'Muy Malo'],
    ['Excelente', 'Muy Buena', 'Regular', 'Malo', 'Muy Malo'],
    ['Excelente', 'Muy Buena', 'Regular', 'Malo', 'Muy Malo'],
    ['Excelente', 'Muy Buena', 'Regular', 'Malo', 'Muy Malo'],
    ['Excelente', 'Muy Buena', 'Regular', 'Malo', 'Muy Malo'],
  ];

  List<String?> selectedAnswers = List.filled(5, null);

  @override
  Widget build(BuildContext context) {
    final List<String> currentSurveyQuestions =
        surveyQuestions[widget.surveyIndex];
    final List<String> currentOptions = options[widget.surveyIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Encuesta ${widget.surveyIndex + 1}'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: currentSurveyQuestions.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4.0,
              margin: EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentSurveyQuestions[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Wrap(
                      children: currentOptions.map((option) {
                        return RadioListTile<String>(
                          title: Text(option),
                          value: option,
                          groupValue: selectedAnswers[index],
                          onChanged: (value) {
                            setState(() {
                              selectedAnswers[index] = value;
                            });
                          },
                        );
                      }).toList(),
                    ),
                    if (selectedAnswers[index] == null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'Por favor, selecciona una opción.',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _submitSurvey,
        icon: Icon(Icons.check),
        label: Text('Enviar'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _submitSurvey() {
    if (selectedAnswers.contains(null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, responde todas las preguntas.'),
          backgroundColor: Colors.redAccent,
        ),
      );
    } else {
      setState(() {
        globalAnswers.addAll(selectedAnswers
            .where((answer) => answer != null)
            .cast<String>());
        completedSurveys[widget.surveyIndex] = true;
      });
      Navigator.pop(context);
    }
  }
}