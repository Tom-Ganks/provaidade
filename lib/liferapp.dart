import 'package:flutter/material.dart';

class LiferAppPage extends StatefulWidget {
  const LiferAppPage({super.key});

  @override
  State<LiferAppPage> createState() => _LiferAppPageState();
}

class _LiferAppPageState extends State<LiferAppPage> {
  final TextEditingController controller = TextEditingController();
  String resultado = '';
  String erro = '';

  calcularFase() {
    setState(() {
      erro = '';
      resultado = '';
      String input = controller.text;

      int? idade = int.tryParse(input);
      if (idade == null) {
        erro = 'Por favor, insira uma idade válida';
      } else {
        resultado = determinarFaseDaVida(idade);
      }
    });
  }

  // (&&) algo que foi pesquisado no google para fazer a funcao
  String determinarFaseDaVida(int idade) {
    if (idade < 3) {
      return "Infância";
    } else if (idade >= 3 && idade <= 12) {
      return "Pré-adolescência";
    } else if (idade >= 13 && idade <= 19) {
      return "Adolescência";
    } else if (idade >= 20 && idade <= 35) {
      return "Juventude";
    } else if (idade >= 36 && idade <= 55) {
      return "Meia-idade";
    } else {
      return "Idoso";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicativo Fases de Vida'),
        backgroundColor: Colors.cyan,
        shadowColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Digite sua idade',
                  prefixIcon: const Icon(Icons.cake),
                  errorText: erro.isNotEmpty
                      ? erro
                      : null, // (errorText: erro.isNotEmpty) estava com erro nao consegui resolver (resolvi pesquisando no sublinhado vermelho) =(
                ),
                textAlign: TextAlign.center),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calcularFase,
              child: const Text('Calculo Fase da vida'),
            ),
            const SizedBox(height: 24.0),
            if (resultado.isNotEmpty)
              Text(
                resultado,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
