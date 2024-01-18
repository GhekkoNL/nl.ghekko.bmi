import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiInfoWidget extends StatelessWidget {
  const BmiInfoWidget({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 150, left: 16, right: 16),
          child: Column(
            children: [
              Text('footerText'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              Text('footerWarning'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      );
}
