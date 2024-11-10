import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/custom_appbar.dart';

class CalculateComeetiView extends StatefulWidget {
  const CalculateComeetiView({super.key});

  @override
  State<CalculateComeetiView> createState() => _CalculateComeetiViewState();
}

class _CalculateComeetiViewState extends State<CalculateComeetiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(title: 'Calculate Comeeti', actions: [], leading: SizedBox.shrink(), ),
    );
  }
}
