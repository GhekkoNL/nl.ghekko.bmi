import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/bmi.dart';
import '../models/bmi_view_model.dart';
import 'bmi_info.dart';
import 'bmi_result.dart';

class BottomContent extends ConsumerStatefulWidget {
  const BottomContent({super.key});

  @override
  ConsumerState createState() => BottomContentState();
}

class BottomContentState extends ConsumerState<BottomContent> {
  Bmi? bmiResult;
  bool isBmiCalculated = false;

  @override
  Widget build(BuildContext context) {
    ref.watch(bmiProvider).when(
          initial: () => isBmiCalculated = false,
          calculated: (bmi) {
            bmiResult = bmi;
            isBmiCalculated = true;
          },
        );

    return CustomPaint(
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 1000),
        firstChild: const BmiInfoWidget(),
        secondChild: isBmiCalculated
            ? BmiResultWidget(bmiResult: bmiResult!)
            : const SizedBox(),
        crossFadeState: !isBmiCalculated
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
      ),
    );
  }
}
