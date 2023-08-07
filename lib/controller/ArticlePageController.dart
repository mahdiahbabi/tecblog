


import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tecblog/component/constanturl.dart';

import '../model/tecblog.dart';
import '../service/DioServise.dart';

class ArticlePageController extends GetxController{

  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    loading.value = true;
    // ignore: todo
    //TODO get userid from getStorage ApiConstant.getArticleList+userid
    var response = await DioService().getMethod(ConstantUrl.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromjson(element));
      });
      loading.value = false;
    }
  }




}