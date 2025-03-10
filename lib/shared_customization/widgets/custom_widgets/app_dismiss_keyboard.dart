import 'package:flutter/material.dart';

class AppDismissKeyboard extends StatelessWidget {
  const AppDismissKeyboard({
    super.key,
    required this.child,
    this.canPop = true,
    this.onPopInvoked,
  });
  final Widget child;
  final bool canPop;
  final void Function(bool didPop)? onPopInvoked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: canPop
          ? child
          : PopScope(
              canPop: canPop,
              onPopInvoked: onPopInvoked,
              child: child,
            ),
    );
  }
}
