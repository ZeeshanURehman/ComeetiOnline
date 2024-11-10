import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/custom_appbar.dart';

class MyComeetiView extends StatefulWidget {
  const MyComeetiView({super.key});

  @override
  State<MyComeetiView> createState() => _MyComeetiViewState();
}

class _MyComeetiViewState extends State<MyComeetiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(title: 'My Comeeti', actions: [], leading: SizedBox.shrink(), ),
    );
  }
}
