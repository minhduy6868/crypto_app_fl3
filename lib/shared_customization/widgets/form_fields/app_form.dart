import 'package:flutter/material.dart';

import '../../data/basic_types.dart';

class AppForm extends StatefulWidget {
  const AppForm({super.key, required this.child});
  final FormChildWidgetBuilder child;

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: widget.child(_formKey),
    );
  }
}
