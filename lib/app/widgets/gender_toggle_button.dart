import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../models/gender.dart';

class GenderToggleButton extends StatelessWidget {
  const GenderToggleButton({
    super.key,
    required this.valueKey,
    this.onTap,
    required this.gender,
    required this.selectedGender,
    required this.text,
  });

  final ValueKey<String> valueKey;
  final VoidCallback? onTap;
  final Gender gender;
  final Gender selectedGender;
  final String text;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = selectedGender == gender
        ? Theme.of(context).primaryColor
        : Theme.of(context).hintColor.withOpacity(0.1);
    final textColor = selectedGender == gender
        ? Theme.of(context).canvasColor
        : Theme.of(context).primaryColor;

    return ElevatedButton(
      key: valueKey,
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) =>
            states.contains(MaterialState.disabled)
                ? Theme.of(context).hintColor.withOpacity(0.1)
                : backgroundColor),
        elevation: MaterialStateProperty.resolveWith<double?>((states) => 0),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>((states) =>
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24)))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(gender == Gender.male ? Icons.male : Icons.female,
              color: textColor, size: 35),
          const Gap(5),
          Text(text, style: TextStyle(color: textColor, fontSize: 18)),
        ],
      ),
    );
  }
}
