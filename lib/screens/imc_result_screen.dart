import 'package:flutter/material.dart';
import 'package:imc_calculator/core/App_color.dart';
import 'package:imc_calculator/core/button_styles.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weight;

  const ImcResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: appBarResult(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    double fixedHeight = height / 100;
    double fixWeight  = weight * 0.4536;
    double imcResultado = fixWeight / (fixedHeight * fixedHeight);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tu Resultado", style: TextStyles.titleStyles),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      getTitileByImc(imcResultado),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: getColorByImc(imcResultado),
                      ),
                    ),
                    Text(
                      imcResultado.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 76,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        getDescriptionByImc(imcResultado),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyles.buttonStyles,
              child: Text("Finalizar", style: TextStyles.bodyStyles),
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBarResult() {
    return AppBar(
      title: Text("Resultado"),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }

  Color getColorByImc(double imcResultado) {
    return switch (imcResultado) {
      < 18.5 => Colors.blue, // IMC bajo
      < 24.9 => Colors.green, //IMC normal
      < 29.9 => Colors.orange, // sobrepeso
      _ => Colors.red, // obesidad
    };
  }

  String getTitileByImc(double imcResultado) {
    return switch (imcResultado) {
      < 18.5 => "Imc Bajo",
      < 24.9 => "Imc Normal",
      < 29.9 => "Sobrepeso",
      _ => "Obesidad",
    };
  }

  String getDescriptionByImc(double imcResultado) {
    return switch (imcResultado) {
      < 18.5 => "Tu peso esta por debajo de lo recomendado",
      < 24.9 => "Tu peso esta dentro del rango saludable",
      < 29.9 =>
        "Tu peso esta por encima de lo recomendable(estas gordo, joder!)",
      _ => "Bueno manitoooooo usted es un tinaco",
    };
  }
}
