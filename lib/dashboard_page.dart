import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final Map<String, dynamic> ultimoResultado;

  const DashboardPage({super.key, required this.ultimoResultado});

  final List<Map<String, dynamic>> resultadosFake = const [
    {"data": "21/09/2025", "pontos": 0},
    {"data": "19/09/2025", "pontos": 15},
  ];

  Color _corNivel(String nivel) {
    switch (nivel) {
      case "Sem":
        return Colors.green;
      case "Leve":
        return Colors.blue;
      case "Moderado":
        return Colors.orange;
      case "Grave":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _nivelFromScore(int score) {
    if (score == 0) return "Sem";
    if (score <= 7) return "Leve";
    if (score <= 14) return "Moderado";
    return "Grave";
  }

  @override
  Widget build(BuildContext context) {
    int pontos = ultimoResultado["pontos"];
    String data = ultimoResultado["data"];
    String nivel = _nivelFromScore(pontos);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade300,
        elevation: 0,
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Bem-vindo
          const Text(
            "Bem-vindo de volta!",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.orange.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Último resultado",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "$nivel ($pontos pontos)",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _corNivel(nivel),
                  ),
                ),
                const SizedBox(height: 5),
                Text("Data: $data"),
              ],
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            "Histórico de resultados",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 10),

          ...resultadosFake.map((res) {
            String nivel = _nivelFromScore(res["pontos"]);
            return ListTile(
              leading: Icon(Icons.insert_chart,
                  color: _corNivel(nivel), size: 30),
              title: Text(
                "Resultado: $nivel",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _corNivel(nivel),
                ),
              ),
              subtitle:
                  Text("Pontos: ${res["pontos"]} - Data: ${res["data"]}"),
            );
          }).toList(),

          const SizedBox(height: 30),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.orange.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Evolução ao longo do tempo",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 150,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 20,
                            height: pontos * 5.0,
                            color: _corNivel(nivel),
                          ),
                          const SizedBox(height: 5),
                          Text(data.substring(0, 5)),
                        ],
                      ),
                      ...resultadosFake.map((res) {
                        String nivel = _nivelFromScore(res["pontos"]);
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 20,
                              height: res["pontos"] * 5.0,
                              color: _corNivel(nivel),
                            ),
                            const SizedBox(height: 5),
                            Text(res["data"].toString().substring(0, 5)),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
