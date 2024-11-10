import 'package:comeeti_online/screens/dashboard/dashboard_view.dart';
import 'package:comeeti_online/screens/notifications_view.dart';
import 'package:comeeti_online/screens/profile/my_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  // Define icons and labels
  final List<IconData> _icons = [
    Icons.home,
    Icons.location_on,
    Icons.qr_code, // Center icon
    Icons.campaign,
    Icons.person,
  ];

  final List<String> _labels = [
    'Home',
    'Cash Points',
    '',
    'Promotions',
    'My Account',
  ];

  // Define screens for each tab
  final List<Widget> _screens = [
    DashboardView(),
    CashPointsScreen(),
    QRCodeScreen(),
    NotificationsView(),
    MyProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _tabItem(IconData icon, String label, {required bool isSelected}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isSelected ? AppColors.green : AppColors.grey,
          size: 24.h,
        ),
        if (label.isNotEmpty) ...[
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: isSelected ? AppColors.green : AppColors.grey,
              fontWeight: FontWeight.w400,
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Display the selected screen
      bottomNavigationBar: Stack(
        children: [
          Container(
            color: AppColors.white,
            height: 72.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_icons.length, (i) {
                if (i == 2) {
                  return Expanded(
                    child: SizedBox(), // Leave space for the center button
                  );
                }
                return Expanded(
                  child: GestureDetector(
                    onTap: () => _onItemTapped(i),
                    child: _tabItem(
                      _icons[i],
                      _labels[i],
                      isSelected: i == _currentIndex,
                    ),
                  ),
                );
              }),
            ),
          ),
          // Center floating button
          Positioned(
            bottom: 12.h,
            left: MediaQuery.of(context).size.width / 2 - 28.h,
            child: GestureDetector(
              onTap: () => _onItemTapped(2),
              child: Container(
                height: 56.h,
                width: 56.h,
                decoration: BoxDecoration(
                  color: AppColors.green,
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
                  color: Colors.white,
                  size: 28.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy screens for each tab

class CashPointsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Cash Points Screen"));
  }
}

class QRCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("QR Code Screen"));
  }
}

