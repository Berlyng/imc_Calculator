import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';
import 'package:imc_calculator/core/App_color.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int SelectedAge = 20;
  int SelectedWeight = 160;
  double height = 180;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(
          SelectorHeight: height,
          onHeightChange: (newHeight) {
            setState(() {
              height = newHeight;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: NumberSelector(
                  title: "PESO",
                  selectedValue: SelectedWeight,
                  onIncrement: () {
                    setState(() {
                      SelectedWeight++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      SelectedWeight--;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: NumberSelector(
                  title: "EDAD",
                  selectedValue: SelectedAge,
                  onIncrement: () {
                    setState(() {
                      SelectedAge++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      SelectedAge--;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImcResultScreen(height: height, weight: SelectedWeight,)),
                );
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text("Calcular", style: TextStyles.bodyStyles),
            ),
          ),
        ),
      ],
    );
  }
}
