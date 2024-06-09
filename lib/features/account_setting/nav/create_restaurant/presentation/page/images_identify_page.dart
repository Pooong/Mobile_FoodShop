import 'package:find_food/core/ui/widgets/appbar/images_identify_appbar.dart';
import 'package:find_food/core/ui/widgets/button/button_widget.dart';
import 'package:find_food/features/account_setting/nav/create_restaurant/presentation/controller/create_restaurant_controller.dart';
import 'package:find_food/features/account_setting/nav/create_restaurant/presentation/page/finish_create_restaurant.dart';
import 'package:find_food/features/account_setting/nav/create_restaurant/presentation/widgets/upload_single_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesIdentifyPage extends GetView<CreateRestaurantController> {
  const ImagesIdentifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ImagesIdentifyAppbar(),
      body: buildImagesIdentifyBody(),
    );
  }

  SingleChildScrollView buildImagesIdentifyBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<CreateRestaurantController>(
          id: "clearData",
          builder: (logic) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    titleField(
                      title: "RESTAURANT BACKGROUND",
                    ),
                    Center(
                      child: UploadSingleImage(
                        circle: false,
                        getImage: ()async{
                          controller.fileUploadBackground = await controller.pickImage();
                          controller.update(["fetchImageSetting"]);
                        },
                        removeSingleImage: () {
                          controller.fileUploadBackground=null;
                          controller.update(["clearData"]);
                        },
                        display: controller.fileUploadBackground,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    titleField(
                      title: "RESTAURANT LOGO",
                    ),
                    Center(
                      child: UploadSingleImage(
                        circle: true,
                        getImage: () async{
                          controller.fileUploadLogo = await controller.pickImage();
                          controller.update(["fetchImageSetting"]);
                        },
                        removeSingleImage: () {
                          controller.fileUploadLogo=null;
                          controller.update(["clearData"]);
                        },
                        display:  controller.fileUploadLogo,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ButtonWidget(
                  ontap: () {
                    Get.to(() => const FinishCreateRestaurantPage());
                  },
                  text: "CONTINUE",
                  fontWeight: FontWeight.bold,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget titleField({required String title}) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
