import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/bmi_view_model.dart';
import 'slider.dart';

class WeightSlider extends ConsumerStatefulWidget {
  const WeightSlider({super.key, required this.onWeightChanged});
  final ValueChanged<int> onWeightChanged;

  @override
  ConsumerState createState() => WeightSliderState();
}

class WeightSliderState extends ConsumerState<WeightSlider> {
  bool isBmiCalculated = false;
  int weight = 75;

  void _onChanged(double value) {
    setState(() => weight = value.round());
    widget.onWeightChanged(value.round());
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(bmiProvider).when(
          initial: () => isBmiCalculated = false,
          calculated: (bmi) => isBmiCalculated = true,
        );

    return CustomSlider(
      min: 40,
      max: 150,
      measurementUnit: 'kg',
      value: weight,
      onChanged: !isBmiCalculated ? _onChanged : null,
    );
  }
}
