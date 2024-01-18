import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/bmi_view_model.dart';
import 'slider.dart';

class HeightSlider extends ConsumerStatefulWidget {
  const HeightSlider({super.key, required this.onHeightChanged});
  final ValueChanged<int> onHeightChanged;

  @override
  ConsumerState createState() => HeightSliderState();
}

class HeightSliderState extends ConsumerState<HeightSlider> {
  int height = 180;
  bool isBmiCalculated = false;

  void _onChanged(double value) {
    setState(() => height = value.round());
    widget.onHeightChanged(value.round());
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(bmiProvider).when(
          initial: () => isBmiCalculated = false,
          calculated: (bmi) => isBmiCalculated = true,
        );

    return CustomSlider(
      min: 120,
      max: 220,
      measurementUnit: 'cm',
      value: height,
      onChanged: !isBmiCalculated ? _onChanged : null,
    );
  }
}
