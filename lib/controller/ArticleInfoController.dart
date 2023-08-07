



import 'dart:math';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../component/constanturl.dart';
import '../model/tecblog.dart';
import '../service/DioServise.dart';

class ArticleInfoController extends GetxController{
  RxBool loading = false.obs;
  RxString id = '0'.obs;
  late Rx<ArticleInfoModel> articleinfo = ArticleInfoModel().obs;
  RxList<ArticleInfoRelated> articleInfoRelated = RxList();
  RxList<ArticleInfoTags> articleInfoTags = RxList();




  getArticleInfo(id)async{
    loading.value = true;
     var response = await DioService().getMethod(ConstantUrl.baseUrl+'article/get.php?command=info&id=$id&user_id=1');
     if(response.statusCode == 200){
          articleinfo.value = ArticleInfoModel.fromjson(response.data);
          response.data.forEach((element){
            articleInfoRelated.add(ArticleInfoRelated.fromjson(element));
          });
          response.data.forEach((element){
            articleInfoTags.add(ArticleInfoTags.fromjson(element));
          });
          // log(https://techblog.sasansafari.comarticle/get.php?command=info&id=$id&user_id=1);
     }
     loading.value = false;
  }


}