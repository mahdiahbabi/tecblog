



import 'dart:math';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../component/constanturl.dart';
import '../model/tecblog.dart';
import '../service/DioServise.dart';

class ArticleInfoController extends GetxController{
  RxBool loading = false.obs;
  RxString id = '0'.obs;
   Rx<ArticleInfoModel> articleinfo = ArticleInfoModel().obs;
  RxList<ArticleInfoRelated> articleInfoRelated = RxList();
  RxList<ArticleInfoTags> articleInfoTags = RxList();

@override
onInit(){
  super.onInit();

  getArticleInfo(id);
}


  getArticleInfo(id)async{

  // articleInfoRelated.clear();
  // articleInfoTags.clear();
    loading.value = true;
     var response = await DioService().getMethod(ConstantUrl.baseUrl+'article/get.php?command=info&id=$id&user_id=1');
     if(response.statusCode == 200){

          articleinfo.value = ArticleInfoModel.fromjson(response.data);
          loading.value = false;
          response.data["related"].forEach((element){
            articleInfoRelated.add(ArticleInfoRelated.fromjson(element));
          });
          response.data["tags"].forEach((element){

            articleInfoTags.add(ArticleInfoTags.fromjson(element));
          });


     }

  }


}