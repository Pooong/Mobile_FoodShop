
import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:get/get.dart';

class PostsDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Prefs(), fenix: true);
    
  }

}