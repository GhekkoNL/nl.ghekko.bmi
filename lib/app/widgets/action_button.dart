import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/bmi_view_model.dart';

class ActionButton extends ConsumerStatefulWidget {
  const ActionButton({super.key, required this.height, required this.weight});
  final int height;
  final int weight;

  @override
  ConsumerState createState() => ActionButtonState();
}

class ActionButtonState extends ConsumerState<ActionButton> {
  bool isBmiCalculated = false;

  void _calculateBmi() {
    ref
        .read(bmiProvider.notifier)
        .calculate(height: widget.height, weight: widget.weight);
  }

  void _resetBmi() {
    ref.read(bmiProvider.notifier).reset();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(bmiProvider).when(
          initial: () => isBmiCalculated = false,
          calculated: (_) => isBmiCalculated = true,
        );

    return FloatingActionButton.large(
        onPressed: isBmiCalculated ? _resetBmi : _calculateBmi,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        elevation: 1,
        child: Icon(
          isBmiCalculated ? Icons.refresh : Icons.trending_flat,
          color: Theme.of(context).primaryColor,
          size: 48,
        ),
    );
  }
}
