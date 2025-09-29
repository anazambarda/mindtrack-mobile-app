import 'package:flutter/material.dart';
import 'result_page.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final List<String> perguntas = [
    "Você tem dores de cabeça frequentes?",
    "Tem falta de apetite?",
    "Dorme mal?",
    "Assusta-se com facilidade?",
    "Tem tremores nas mãos?",
    "Sente-se nervoso(a), tenso(a) ou preocupado(a)?",
    "Tem má digestão?",
    "Tem dificuldades de pensar com clareza?",
    "Tem se sentido triste ultimamente?",
    "Tem chorado mais do que de costume?",
    "Encontra dificuldades para realizar com satisfação suas atividades diárias?",
    "Tem dificuldades para tomar decisões?",
    "Tem dificuldades no serviço (seu trabalho é penoso, causa-lhe sofrimento)?",
    "É incapaz de desempenhar um papel útil em sua vida?",
    "Tem perdido o interesse pelas coisas?",
    "Você se sente uma pessoa inútil, sem préstimo?",
    "Tem tido ideia de acabar com a vida?",
    "Sente-se cansado(a) o tempo todo?",
    "Você se cansa com facilidade?",
    "Tem sensações desagradáveis no estômago?",
  ];

  late List<bool?> respostas;

  @override
  void initState() {
    super.initState();
    respostas = List<bool?>.filled(perguntas.length, null);
  }

  void _verResultado() {
  if (respostas.contains(null)) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Responda todas as perguntas antes de ver o resultado."),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  int totalSim = respostas.where((r) => r == true).length;

  String dataAtual =
      "${DateTime.now().day.toString().padLeft(2, '0')}/"
      "${DateTime.now().month.toString().padLeft(2, '0')}/"
      "${DateTime.now().year}";

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ResultPage(score: totalSim, data: dataAtual),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "Você precisa cuidar da saúde mental!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "A saúde mental é essencial porque influencia como pensamos, "
              "sentimos e agimos no dia a dia. Ela afeta nossas relações, "
              "decisões e bem-estar geral, sendo tão importante quanto a saúde física.\n\n"
              "As perguntas abaixo são do instrumento Self Report Questionnaire (SRQ 20), "
              "para rastreamento de sofrimento mental, e não de diagnóstico psiquiátrico "
              "(diagnóstico só pode ser fornecido por um profissional).\n\n"
              "Para uma análise precisa, responda a todas as questões.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),

            ...List.generate(perguntas.length, (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${index + 1} - ${perguntas[index]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Radio<bool>(
                        value: true,
                        groupValue: respostas[index],
                        onChanged: (value) {
                          setState(() {
                            respostas[index] = value;
                          });
                        },
                      ),
                      const Text("Sim"),
                      Radio<bool>(
                        value: false,
                        groupValue: respostas[index],
                        onChanged: (value) {
                          setState(() {
                            respostas[index] = value;
                          });
                        },
                      ),
                      const Text("Não"),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              );
            }),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: _verResultado,
              child: const Text(
                "Ver resultado",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
