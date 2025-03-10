import 'package:flutter/material.dart';

enum KeyboardType {
  text,
  multiline,
  int,
  double,
  phone,
  datetime,
  emailAddress,
  url,
  visiblePassword,
  name,
  streetAddress,
  none,
  money,
}

extension KeyboardTypeExt on KeyboardType {
  TextInputType get inputType => {
        KeyboardType.text: TextInputType.text,
        KeyboardType.multiline: TextInputType.multiline,
        KeyboardType.int: const TextInputType.numberWithOptions(signed: false),
        KeyboardType.double:
            const TextInputType.numberWithOptions(decimal: true),
        KeyboardType.phone: TextInputType.phone,
        KeyboardType.datetime: TextInputType.datetime,
        KeyboardType.emailAddress: TextInputType.emailAddress,
        KeyboardType.url: TextInputType.url,
        KeyboardType.visiblePassword: TextInputType.visiblePassword,
        KeyboardType.name: TextInputType.name,
        KeyboardType.streetAddress: TextInputType.streetAddress,
        KeyboardType.none: TextInputType.none,
        KeyboardType.money:
            const TextInputType.numberWithOptions(signed: false),
      }[this]!;
}
