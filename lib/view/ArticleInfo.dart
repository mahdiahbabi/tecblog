import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tecblog/component/my_component.dart';
import 'package:tecblog/component/my_string.dart';
import 'package:tecblog/controller/ArticleInfoController.dart';
import '../component/my_colors.dart';
import '../gen/assets.gen.dart';

class ArticleInfo extends StatefulWidget {
  const ArticleInfo({super.key});

  @override
  State<ArticleInfo> createState() => _ArticleInfoState();
}

class _ArticleInfoState extends State<ArticleInfo> {
  ArticleInfoController articleInfoController =
  Get.put(ArticleInfoController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    articleInfoController.getArticleInfo(articleInfoController.id.value);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Obx(
              () => SizedBox(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 3,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          top: 5,
                          left: 0,
                          right: 0,
                          child: CachedNetworkImage(
                            imageUrl:
                            articleInfoController.articleinfo.value.image ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjzC2JyZDZ_RaWf0qp11K0lcvB6b6kYNMoqtZAQ9hiPZ4cTIOB',
                            width: double.infinity,
                            height: 250,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(image: imageProvider),
                              ),
                            ),
                            placeholder: (context, url) => SpinKitChasingDots(),
                            errorWidget: (context, url, error) => const Center(
                                child: Icon(Icons.image_not_supported)),
                          ),
                        ),
                        // TODO: قابلیت انتشار را در اپ بار امکان پذیر کم
                        Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: GradiantColors.articleInfo,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.arrow_forward_outlined)),
                                const Expanded(
                                  child: SizedBox(),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.share)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.bookmark_border_outlined)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      articleInfoController.articleinfo.value.title!,
                      style: theme.titleLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(articleInfoController.articleinfo.value.author == null ? MyStrings.articleananumusaouthor : articleInfoController.articleinfo.value.author! ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                            articleInfoController.articleinfo.value.created_at!)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    Text(articleInfoController.articleinfo.value.content!),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                          articleInfoController.articleInfoTags.length,
                          itemBuilder: (context, index) {
                            return MainTagInfo(
                              articleInfoController: articleInfoController,
                              theme: theme,
                              index: index,
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 4,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                      articleInfoController.articleInfoRelated.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            articleInfoController.id.value = articleInfoController.articleInfoRelated.value[index].related_id!;
                            articleInfoController.getArticleInfo(articleInfoController.id.value);
                            Get.to(()=>const ArticleInfo());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              width: 190,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: articleInfoController
                                            .articleInfoRelated
                                            .value[index]
                                            .related_image!,
                                        height: size.height * 3 / 18,
                                        width: 190,
                                        imageBuilder: (context, imageProvider) {
                                          return Container(
                                            height: 110,
                                            width: 190,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(35),
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover),
                                            ),
                                            foregroundDecoration:
                                            const BoxDecoration(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(35)),
                                                gradient: LinearGradient(
                                                    colors: GradiantColors
                                                        .articleInfoRelated,
                                                    begin: Alignment
                                                        .bottomCenter,
                                                    end:
                                                    Alignment.topCenter)),
                                          );
                                        },
                                        placeholder: (context, url) =>
                                            spinkit(Colors.pink),
                                        errorWidget: (context, url, error) =>
                                        const Icon(Icons
                                            .image_not_supported_outlined),
                                      ),
                                      Positioned(
                                        bottom: 10,
                                        left: 10,
                                        right: 10,
                                        child: SizedBox(
                                          child: Row(
                                            children: [
                                              Text(
                                                articleInfoController
                                                    .articleInfoRelated
                                                    .value[index]
                                                    .related_author ==
                                                    null
                                                    ? MyStrings
                                                    .articleananumusaouthor
                                                    : articleInfoController
                                                    .articleInfoRelated
                                                    .value[index]
                                                    .related_author!,
                                                style: theme.titleSmall,
                                              ),
                                              Expanded(
                                                  child: SizedBox(
                                                    height: 10,
                                                  )),
                                              Icon(Icons.remove_red_eye_outlined),
                                              Text(
                                                articleInfoController
                                                    .articleInfoRelated
                                                    .value[index]
                                                    .related_view!,
                                                style: theme.titleSmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    articleInfoController.articleInfoRelated
                                        .value[index].related_title!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}