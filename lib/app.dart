import 'package:bmi/app/locale/language_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'app/models/bmi.dart';
import 'app/models/bmi_view_model.dart';
import 'app/models/gender.dart';
import 'app/widgets/action_button.dart';
import 'app/widgets/bottom_content.dart';
import 'app/widgets/gender_toggle_button.dart';
import 'app/widgets/height_slider.dart';
import 'app/widgets/weight_slider.dart';

class BMIApp extends ConsumerStatefulWidget {
  const BMIApp({super.key, required this.title});
  final String title;

  @override
  ConsumerState createState() => BMIAppState();
}

class BMIAppState extends ConsumerState<BMIApp> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 75;
  bool isBmiCalculated = false;
  Bmi? bmiResult;

  void _onGenderChanged(Gender newGender) =>
      setState(() => selectedGender = newGender);

  void _onHeightChanged(int newHeight) => setState(() => height = newHeight);

  void _onWeightChanged(int newWeight) => setState(() => weight = newWeight);

  @override
  Widget build(BuildContext context) {
    ref.watch(bmiProvider).when(
          initial: () => isBmiCalculated = false,
          calculated: (bmi) {
            bmiResult = bmi;
            isBmiCalculated = true;
          },
        );
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(widget.title),
          centerTitle: false,
          actions: const [
            LanguageSwitch(),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(20),
            Text('headText'.tr,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(30),
            Text('pickGender'.tr,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 170,
                  height: 45,
                  child: GenderToggleButton(
                    valueKey: ValueKey<String>('male'.tr),
                    onTap: isBmiCalculated
                        ? null
                        : () => _onGenderChanged(Gender.male),
                    gender: Gender.male,
                    selectedGender: selectedGender,
                    text: 'male'.tr,
                  ),
                ),
                const Gap(15),
                SizedBox(
                  width: 170,
                  height: 45,
                  child: GenderToggleButton(
                    valueKey: ValueKey<String>('female'.tr),
                    onTap: isBmiCalculated
                        ? null
                        : () => _onGenderChanged(Gender.female),
                    gender: Gender.female,
                    selectedGender: selectedGender,
                    text: 'female'.tr,
                  ),
                ),
              ],
            ),
            const Gap(20),
            Container(
              margin: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Text('length'.tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 36),
                    child: HeightSlider(onHeightChanged: _onHeightChanged),
                  ),
                  Text('weight'.tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 36),
                    child: WeightSlider(onWeightChanged: _onWeightChanged),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 270,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  const BottomContent(),
                  Padding(
                    padding: const EdgeInsets.only(right: 32),
                    child: ActionButton(height: height, weight: weight),
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
