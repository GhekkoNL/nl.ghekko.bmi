import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      icon: Icon(Icons.g_translate,
        color: Theme.of(context).primaryColor,),
      itemBuilder: (BuildContext bc) {
        return [
          PopupMenuItem(
            onTap: () {
            },
            child: const EnglishSwitch(),
          ),
          PopupMenuItem(
            child: const DutchSwitch(),
            onTap: () {
            },
          ),
        ];
      },
    );
  }
}

var localeNL = const Locale('nl', 'NL');

class DutchSwitch extends StatelessWidget {
  const DutchSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Row(
        children: [
          Image.asset('assets/icons/nl.png', width: 20),
          const Gap(10),
          Text('dutch'.tr, style: TextStyle(fontSize: 12,
              color: Theme.of(context).primaryColor)),
        ],
      ),
      onPressed: () {
        Get.updateLocale(localeNL);
      },
    );
  }
}

var localeEN = const Locale('en', 'GB');

class EnglishSwitch extends StatelessWidget {
  const EnglishSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Row(
        children: [
          Image.asset('assets/icons/gb.png', width: 20),
          const Gap(10),
          Text('english'.tr, style: TextStyle(fontSize: 12,
              color: Theme.of(context).primaryColor)),
        ],
      ),
      onPressed: () {
        Get.updateLocale(localeEN);
      },
    );
  }
}
