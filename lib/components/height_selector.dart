import 'dart:math';

import 'package:flutter/material.dart';
import 'package:imc_calculator/core/App_color.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final double SelectorHeight ; 
  final Function(double) onHeightChange;

  const HeightSelector({super.key, required this.SelectorHeight, required this.onHeightChange});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("ALTURA", style: TextStyles.bodyStyles,),
            ),
            Text("${widget.SelectorHeight.toStringAsFixed(0)} cm", style: 
            TextStyle(color: Colors.white,
            fontSize: 38,
            fontWeight: FontWeight.bold),),
            Slider(value: widget.SelectorHeight, onChanged: (newHeight){
             widget.onHeightChange(newHeight);
            },
            min: 150,
            max: 220,
            divisions: 70,
            label: "${widget.SelectorHeight}",
            activeColor: AppColors.primary,)
          ],
        ),
      ),
    );
  }
}