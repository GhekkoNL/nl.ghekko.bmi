import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/bmi.dart';
import 'bmi_chart.dart';

class BmiResultWidget extends StatelessWidget {
  const BmiResultWidget({super.key, required this.bmiResult});

  final Bmi bmiResult;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 110, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('yourBMI'.tr, style: Theme.of(context).textTheme.bodyLarge),
                const BmiChartButton(),
              ],
            ),
            BmiValue(bmiResult: bmiResult),
            const SizedBox(height: 10),
            BmiInterpretation(bmiResult: bmiResult),
          ],
        ),
      );
}

class BmiChartButton extends StatelessWidget {
  const BmiChartButton({super.key});

  void _showBmiChart(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (_) => const BmiChartWidget(),
      constraints: BoxConstraints.tight(const Size.fromWidth(500)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showBmiChart(context),
      child: Row(
        children: [
          Text('bmiChart'.tr, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(width: 4),
          const Icon(Icons.expand_less),
        ],
      ),
    );
  }
}

class BmiInterpretation extends StatelessWidget {
  const BmiInterpretation({super.key, required this.bmiResult});
  final Bmi bmiResult;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(bmiResult.getInterpretationText(context),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.green, fontWeight: FontWeight.bold)),
    );
  }
}

class BmiValue extends StatelessWidget {
  const BmiValue({super.key, required this.bmiResult});

  final Bmi bmiResult;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          bmiResult.wholeNumber,
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text(
          bmiResult.decimalPart,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
