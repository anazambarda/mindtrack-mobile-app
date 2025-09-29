import 'package:flutter/material.dart';
import 'test_page.dart';
import 'dashboard_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade200,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
              "Vamos\ncomeçar",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900, 
                color: Colors.white,
                height: 1.2,
              ),
            ),

              const SizedBox(height: 40),

              _OptionCard(
                titulo: "Iniciar um novo teste",
                descricao:
                    "Reserve um momento pra si, descubra como está sua saúde mental com um teste rápido, simples e reflexivo.",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TestPage()),
                  );
                },
              ),
              const SizedBox(height: 20),

             _OptionCard(
              titulo: "Ir para o dashboard",
              descricao:
                  "Acompanhe sua jornada, acesse seu painel e veja seus resultados e progresso em um só lugar.",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardPage(
                      ultimoResultado: {
                        "pontos": 9,
                        "data": "20/09/2025",
                      },
                    ),
                  ),
                );
              },
            ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  final String titulo;
  final String descricao;
  final VoidCallback onTap;

  const _OptionCard({
    required this.titulo,
    required this.descricao,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    descricao,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.play_arrow,
              color: Colors.orange,
              size: 32,
            ),
          ],
        ),
      ),
    );
  }
}
