import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '/shared_customization/extensions/list_ext.dart';
import '/shared_customization/data/basic_types.dart';
import '/app_common_data/app_text_sytle.dart';

class AppReplaceText extends StatelessWidget {
  final String originalText;
  final TextStyle style;
  final List<AppReplaceTextSpan> spans;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;

  const AppReplaceText({
    super.key,
    required this.originalText,
    required this.spans,
    this.style = AppTextStyle.defaultStyle,
    this.textAlign = TextAlign.center,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, AppReplaceTextSpan> spanMap = {
      for (var element in spans) element.matchKey: element
    };
    Map<String, VoidCallback?> reconizers = {
      for (var element in spans) element.matchKey: element.onTap
    };
    RegExp matchKeyRegExps =
        RegExp(spans.map((e) => '({${e.matchKey}})').join('|'));
    List<RegExpMatch> matches =
        matchKeyRegExps.allMatches(originalText).toList();
    int currentBeginIndex = 0;
    List<TextSpan> textSpans = matches.fold([], (previous, current) {
      String currentKey =
          originalText.substring(current.start + 1, current.end - 1);
      int beginIndex = currentBeginIndex;
      currentBeginIndex = current.end;
      return [
        ...previous,
        TextSpan(text: originalText.substring(beginIndex, current.start)),
        TextSpan(
            text: spanMap[currentKey]?.replaceText ?? 'This is not match',
            style: spanMap[currentKey]?.updateStyle?.call(style) ?? style,
            recognizer: reconizers[currentKey] != null
                ? (TapGestureRecognizer()..onTap = reconizers[currentKey])
                : null)
      ];
    });

    return RichText(
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      text: TextSpan(style: style, children: [
        ...textSpans,
        TextSpan(
            text: originalText
                .substring(matches.isNotEmptyOrNull ? matches.last.end : 0))
      ]),
    );
  }
}

///
/// Model ReplaceSpan
///
class AppReplaceTextSpan {
  final String matchKey;
  final String replaceText;
  final VoidCallback? onTap;
  final UpdateStyleCallBack? updateStyle;

  AppReplaceTextSpan({
    required this.matchKey,
    required this.replaceText,
    this.onTap,
    this.updateStyle,
  });
}
