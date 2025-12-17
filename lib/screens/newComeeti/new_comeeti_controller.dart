import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';

class CreateComeetiController extends GetxController {
  // Reactive dropdown values
  RxString? committeeType = RxString('');
  RxString? duration = RxString('');
  RxString? investmentAmount = RxString('');
  RxString? totalMembers = RxString('');
  RxString? availableMonths = RxString('');

  // Dropdown options
  final List<String> committeeTypeOptions = ["Lucky", "Monthly", "15-Day"];
  final List<String> durationOptions = ["6 Months", "12 Months", "18 Months", "24 Months"];
  final List<String> amountOptions = ["200", "500", "1000", "2000", "3000", "5000"];
  final List<String> monthOptions = ["6", "12", "18", "24"];
  final List<String> memberOptions = List.generate(20, (i) => "${i + 5}");

  void setCommitteeType(String value) => committeeType!.value = value;
  void setDuration(String value) => duration!.value = value;
  void setInvestmentAmount(String value) => investmentAmount!.value = value;
  void setTotalMembers(String value) => totalMembers!.value = value;
  void setAvailableMonths(String value) => availableMonths!.value = value;

  void createComeeti() {
    if (committeeType!.value.isEmpty ||
        duration!.value.isEmpty ||
        investmentAmount!.value.isEmpty ||
        totalMembers!.value.isEmpty ||
        availableMonths!.value.isEmpty) {
      Get.snackbar("Incomplete Form", "Please fill all fields before creating a Comeeti.");
      return;
    }

    // Here you would call your API or logic to create a Comeeti
    Get.snackbar("Success", "Comeeti Created Successfully ✅");
  }
}


class SelectComeetiController extends GetxController {
  // Months list
  final RxList<String> months = <String>[
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ].obs;

  final RxSet<int> initiallySelectedIndices = <int>{2, 3, 7, 11}.obs;

  final RxSet<int> selectedIndices = <int>{2, 3, 7, 11}.obs;
  // Payment options
  final List<String> images = [
    AppImages.easypaisa,
    AppImages.jazzcash,
    AppImages.visa,
  ];

  // Payment text controllers
  final List<TextEditingController> controllers =
  List.generate(3, (_) => TextEditingController());

  // Select or deselect months
  void toggleMonthSelection(int index, BuildContext context) {
    if (initiallySelectedIndices.contains(index)) {
      _showLockedMonthDialog(context);
    } else if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
    } else if (selectedIndices.length < 5) {
      selectedIndices.add(index);
    }
  }

  // Alert dialog for pre-selected months
  void _showLockedMonthDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Image.asset(AppImages.alert, height: 60),
        content: const Text(
          'This month is pre-selected by someone else, please choose from available months.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('OK', style: TextStyle(color: AppColors.blue)),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  // Show payment bottom sheet
  void showPaymentSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (_, __) => Divider(color: AppColors.grey),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    leading: Image.asset(images[index], height: 24),
                    title: const Text(''),
                    iconColor: AppColors.grey,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.background,
                              ),
                              child: const Center(child: Text('92')),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: controllers[index],
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                decoration: const InputDecoration(
                                  counterText: '',
                                  hintText: 'xxxxxxxxxx',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: Text(
                  'Close',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  @override
  void onClose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.onClose();
  }
}
