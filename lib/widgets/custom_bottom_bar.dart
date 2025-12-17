import 'package:comeeti_online/screens/all_comeeties_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import '../../utils/app_colors.dart';
import '../screens/cashPoint/cash_point_view.dart';
import '../screens/dashboard/views/dashboard_view.dart';
import '../screens/notifications_view.dart';
import '../screens/profile/my_profile_view.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({Key? key}) : super(key: key);

  // Controller for navigation index
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  final List<IconData> _icons = [
    Icons.home,
    Icons.location_on,
    Icons.qr_code, // Center icon
    Icons.campaign,
    Icons.person,
  ];

  final List<String> _labels = [
    'Home',
    'Contact with Nearby Admins',
    '',
    'My Commeties',
    'My Account',
  ];

  final List<Widget> _screens = [
    DashboardView(),
    CashPointsScreen(),
    QRCodeScreen(),
    AllComeetiesView(),
    UserProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentIndex,
      builder: (context, index, _) {
        return Scaffold(
          body: _screens[index],
          bottomNavigationBar: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  color: AppColors.blue,
                  height: 74.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(_icons.length, (i) {
                      if (i == 2) {
                        return const Expanded(child: SizedBox());
                      }
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => currentIndex.value = i,
                          child: _tabItem(
                            icon: _icons[i],
                            label: _labels[i],
                            isSelected: i == index,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              // Center floating button
              Positioned(
                bottom: 22.h,
                left: MediaQuery.of(context).size.width / 2 - 28.h,
                child: GestureDetector(
                  onTap: () => currentIndex.value = 2,
                  child: Container(
                    height: 50.h,
                    width: 50.h,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      _icons[2],
                      color: AppColors.blue,
                      size: 28.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _tabItem({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    final isContactTab = label == 'Contact with Nearby Admins';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isSelected ? AppColors.white : AppColors.grey,
          size: 24.h,
        ),
        if (label.isNotEmpty) ...[
          SizedBox(height: 4.h),
          if (isContactTab)
            SizedBox(
              width: 80.w,
              height: 16.h,
              child: Marquee(
                text: label,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: isSelected ? AppColors.white : AppColors.grey,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                ),
                scrollAxis: Axis.horizontal,
                blankSpace: 20.0,
                velocity: 35.0,
                pauseAfterRound: const Duration(seconds: 1),
              ),
            )
          else
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                color: isSelected ? AppColors.white : AppColors.grey,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
              ),
            ),
        ],
      ],
    );
  }
}

// Dummy screen for QR Code
class QRCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("QR Code Screen"));
  }
}
