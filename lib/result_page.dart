import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final String data;

  const ResultPage({super.key, required this.score, required this.data});


  Map<String, dynamic> _getResultado() {
    if (score == 0) {
      return {
        "titulo": "Sem sofrimento mental",
        "mensagem":
            "Seu resultado indica que, no momento, você não apresenta sinais de sofrimento mental significativos.\n\n"
            "Isso é um ótimo sinal! Continue se cuidando, prestando atenção ao seu bem-estar físico e emocional.\n"
            "Manter bons hábitos e buscar equilíbrio na rotina são atitudes importantes para preservar a saúde mental.",
        "cor": Colors.green,
      };
    } else if (score >= 1 && score <= 7) {
      return {
        "titulo": "Sofrimento mental leve",
        "mensagem":
            "Você apresentou alguns sinais leves de sofrimento mental.\n\n"
            "Isso pode estar ligado a fatores como estresse, cansaço ou mudanças na rotina. "
            "Fique atento(a) aos seus sentimentos e tente reservar momentos para relaxar, dormir bem "
            "e praticar atividades que você gosta. Cuidar de você é essencial!",
        "cor": Colors.blue,
      };
    } else if (score >= 8 && score <= 14) {
      return {
        "titulo": "Sofrimento mental moderado",
        "mensagem":
            "Seu resultado mostra indícios moderados de sofrimento mental.\n\n"
            "Pode ser que você esteja enfrentando dificuldades para dormir, se concentrar ou lidar com suas emoções. "
            "Isso merece atenção. Tente conversar com alguém de confiança, buscar apoio psicológico "
            "ou adotar pequenas mudanças na rotina para aliviar esse peso. Você não está sozinho(a).",
        "cor": Colors.orange,
      };
    } else {
      return {
        "titulo": "Sofrimento mental grave",
        "mensagem":
            "Seu resultado aponta sinais mais intensos de sofrimento mental, como tristeza frequente, cansaço constante "
            "ou pensamentos negativos.\n\n"
            "É muito importante buscar apoio profissional nesse momento. Falar com um psicólogo, médico ou outro profissional pode fazer toda a diferença.\n"
            "Você é importante, e cuidar da sua saúde mental é uma prioridade.",
        "cor": Colors.red,
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final resultado = _getResultado();

    return Scaffold(
      backgroundColor: Colors.orange.shade200,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "RESULTADO",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                resultado["titulo"],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: resultado["cor"],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                resultado["mensagem"],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
             onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashboardPage(
                    ultimoResultado: {"pontos": score, "data": data},
                  ),
                ),
              );
            },


                child: const Text(
                  "Visualizar dash",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
