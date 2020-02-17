import 'package:flutter/material.dart';
import 'package:metrics/features/common/presentation/metrics_theme/widgets/metrics_theme.dart';
import 'package:metrics/features/dashboard/presentation/widgets/circle_percentage.dart';

class CoverageCirclePercentage extends StatelessWidget {
  final String title;
  final double value;
  
  const CoverageCirclePercentage({Key key, @required this.title, @required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final circlePercentageAccentTheme =
        MetricsTheme.of(context).circlePercentageAccentTheme;

    return CirclePercentage(
      title: title,
      value: value,
      valueColor: circlePercentageAccentTheme.primaryColor,
      strokeColor: circlePercentageAccentTheme.accentColor,
      backgroundColor: circlePercentageAccentTheme.backgroundColor,
    );
  }
}