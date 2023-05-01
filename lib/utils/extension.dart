import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget giveLPadding({double? padding}) => Padding(
        padding: EdgeInsets.only(left: padding ?? 0),
        child: this,
      );
  Widget giveRPadding({double? padding}) => Padding(
        padding: EdgeInsets.only(right: padding ?? 0),
        child: this,
      );

  Widget giveHPadding({double? padding}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
        child: this,
      );
  Widget giveBPadding({double? padding}) => Padding(
        padding: EdgeInsets.only(bottom: padding ?? 0),
        child: this,
      );
}
