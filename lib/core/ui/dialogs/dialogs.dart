// DialogsUtils class (updated with Cancel button)
import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/configs/enum.dart'; // Import TypeDialog
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:lottie/lottie.dart';

class DialogsUtils {
  static void showAlterLoading() {
    Get.dialog(Dialog(
      backgroundColor: AppColors.white.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: 160,
        width: 40,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            // Lottie.asset('assets/jsons/loading.json', height: 60.0),
            const SizedBox(height: 10),
            const TextWidget(
              text: "Loading....",
              fontWeight: FontWeight.w600,
            ),
            LoadingAnimationWidget.staggeredDotsWave(
              color: AppColors.primary,
              size: 40,
            ),
          ],
        ),
      ),
    ));
  }

  static void showRatingDialog({
    required double initialRating,
    required ValueChanged<double> onRatingUpdate,
    VoidCallback? onSubmit,
  }) {
    double currentRating = initialRating;

    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xFFEBEDF0),
        elevation: 50.0,
        contentPadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFFEBEDF0), width: 4.0),
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        content: Wrap(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: AppColors.white,
              ),
              child: Column(
                children: [
                  RatingBar.builder(
                    initialRating: initialRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star_rounded,
                      color: Color.fromARGB(255, 255, 232, 59),
                    ),
                    onRatingUpdate: (rating) {
                      currentRating = rating;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Click To Rate",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: AppDimens.textSize20,
                            color: AppColors.black,
                          ),
                        ),
                        Image.asset("assets/images/click_rate.png"),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        onRatingUpdate(currentRating);
                        if (onSubmit != null) {
                          onSubmit();
                        }
                        Get.back(); // Close dialog
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60),
                        child: TextWidget(
                            text: "Rate",
                            size: AppDimens.textSize20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showAlertDialog({
    required String title,
    required String message,
    required TypeDialog typeDialog,
    VoidCallback? onPresss,
  }) {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xFFEBEDF0),
        elevation: 50.0,
        contentPadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFFEBEDF0), width: 4.0),
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        content: Wrap(
          children: [
            Container(
              width: 337,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: AppColors.white,
              ),
              child: Column(
                children: [
                  Container(
                    width: 30.0,
                    height: 30.0,
                    margin: const EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: typeDialog == TypeDialog.error
                          ? AppColors.greenBold
                          : typeDialog == TypeDialog.success
                              ? AppColors.primary
                              : Colors.amber,
                    ),
                    child: Icon(
                      typeDialog == TypeDialog.error
                          ? Icons.priority_high
                          : typeDialog == TypeDialog.success
                              ? Icons.check
                              : Icons.warning,
                      color: Colors.white,
                    ),
                  ),
                  title.isNotEmpty
                      ? Text(
                          title.tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppDimens.textSize18,
                              color: AppColors.black),
                        )
                      : const SizedBox.shrink(),
                  Container(
                    width: 300.0,
                    margin: const EdgeInsets.only(
                        top: 16.0, bottom: 22.0, left: 10.0, right: 10),
                    child: Text(
                      message.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: AppDimens.textSize16,
                          color: Color(0xFF4B5767)),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                      color: Color(0xFFEBEDF0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xFFD2D3D4),
                              elevation: 0.0,
                              backgroundColor: const Color(0xFFEBEDF0),
                              padding: EdgeInsets.zero,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Hủy',
                              style: TextStyle(
                                fontSize: AppDimens.textSize18,
                                color: AppColors.black,
                              ),
                            ),
                            onPressed: () {
                              Get.back(closeOverlays: true); // Đóng dialog
                            },
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xFFD2D3D4),
                              elevation: 0.0,
                              backgroundColor: const Color(0xFFEBEDF0),
                              padding: EdgeInsets.zero,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                            ),
                            child: const Text(
                              'OK',
                              style: TextStyle(
                                fontSize: AppDimens.textSize18,
                                color: AppColors.black,
                              ),
                            ),
                            onPressed: () {
                              if (onPresss != null) {
                                onPresss();
                              }
                              Get.back(); // Đóng dialog
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


 //========================= RATING ===============================================
//   static void showRatingDialog({
//     required double initialRating,
//     required ValueChanged<double> onRatingUpdate,
//     VoidCallback? onSubmit,
//   }) {
//     double currentRating = initialRating;

//     Get.dialog(
//       AlertDialog(
//         backgroundColor: const Color(0xFFEBEDF0),
//         elevation: 50.0,
//         contentPadding: EdgeInsets.zero,
//         shape: const RoundedRectangleBorder(
//           side: BorderSide(color: Color(0xFFEBEDF0), width: 4.0),
//           borderRadius: BorderRadius.all(
//             Radius.circular(16.0),
//           ),
//         ),
//         content: Wrap(
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//               width: 350,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16.0),
//                 color: AppColors.white,
//               ),
//               child: Column(
//                 children: [
//                   RatingBar.builder(
//                     initialRating: initialRating,
//                     minRating: 1,
//                     direction: Axis.horizontal,
//                     allowHalfRating: false,
//                     itemCount: 5,
//                     itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//                     itemBuilder: (context, _) => const Icon(
//                       Icons.star_rounded,
//                       color: Color.fromARGB(255, 255, 232, 59),
//                     ),
//                     onRatingUpdate: (rating) {
//                       currentRating = rating;
//                     },
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           "Click To Rate",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: AppDimens.textSize20,
//                             color: AppColors.black,
//                           ),
//                         ),
//                         Image.asset("assets/images/click_rate.png"),
//                       ],
//                     ),
//                   ),
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           foregroundColor: AppColors.primary,
//                           backgroundColor: AppColors.primary,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5))),
//                       onPressed: () {
//                         onRatingUpdate(currentRating);
//                         if (onSubmit != null) {
//                           onSubmit();
//                         }
//                         Get.back(); // Close dialog
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 60),
//                         child: TextWidget(
//                             text: "Rate",
//                             size: AppDimens.textSize20,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.white),
//                       ))
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
