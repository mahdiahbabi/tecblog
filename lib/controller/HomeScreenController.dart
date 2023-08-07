
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tecblog/component/constanturl.dart';

import '../model/tecblog.dart';
import '../service/DioServise.dart';

class HomeScreenController extends GetxController {

  RxBool loading = true.obs;
   late Rx<PosterModel> poster = PosterModel().obs ;
  RxList tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcastsList = RxList();

  // RxList<TagsModel> taglist = RxList();

  @override
  onInit() {
    super.onInit();
    getHomeItems();

  }

  getHomeItems() async {
    loading.value = true;
    var response = await DioService().getMethod(ConstantUrl.getHomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromjson(element));
      });
      response.data['top_podcasts'].forEach((element) {
        topPodcastsList.add(PodcastModel.fromjson(element));
      });
      response.data['tags'].forEach((element) {
        tagsList.add(TagsModel.fromjson(element));
      });
poster.value = PosterModel.fromjson(response.data['poster']);

    }
    loading.value = false;

  }
}
