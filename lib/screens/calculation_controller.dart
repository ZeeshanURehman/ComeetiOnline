import 'package:get/get.dart';

class CalculateComeetiController extends GetxController {
  // Dropdown selections
  RxString committeeType = ''.obs;
  RxString investmentAmount = ''.obs;
  RxString totalMembers = ''.obs;

  // Calculated results
  RxString totalPool = '0'.obs;
  RxString estimatedProfit = '0'.obs;
  RxString expectedReturn = '0'.obs;
  RxString profitPercentage = '0'.obs;
  RxString duration = ''.obs;

  // Comeeti type durations
  final Map<String, int> typeDurations = {
    "15-Day": 15,
    "Monthly": 30,
    "Lucky": 30,
  };

  /// Main calculation logic
  void calculateComeeti() {
    final investment = double.tryParse(investmentAmount.value) ?? 0;
    final members = double.tryParse(totalMembers.value) ?? 0;

    if (committeeType.value.isEmpty || investment <= 0 || members <= 0) {
      Get.snackbar(
        'Missing Data',
        'Please select valid comeeti type, investment, and members.',
      );
      return;
    }

    final durationDays = typeDurations[committeeType.value] ?? 30;

    final pool = investment * members;
    const baseMonthlyRate = 0.08;
    final profitRate = baseMonthlyRate * (durationDays / 30);
    final profit = pool * profitRate;
    final expected = pool + profit;

    totalPool.value = pool.toStringAsFixed(0);
    estimatedProfit.value = profit.toStringAsFixed(0);
    expectedReturn.value = expected.toStringAsFixed(0);
    profitPercentage.value = (profitRate * 100).toStringAsFixed(1);
    duration.value = "$durationDays Days";
  }

  /// Reset values
  void reset() {
    committeeType.value = '';
    investmentAmount.value = '';
    totalMembers.value = '';
    totalPool.value = '0';
    estimatedProfit.value = '0';
    expectedReturn.value = '0';
    profitPercentage.value = '0';
    duration.value = '';
  }

  void saveEstimate() {
    Get.snackbar('Saved', 'Estimate saved successfully!');
  }

  void joinComeeti() {
    Get.snackbar('Joined', 'You joined the Comeeti successfully!');
  }
}
