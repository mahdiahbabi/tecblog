


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tecblog/component/my_component.dart';
import 'package:tecblog/component/my_string.dart';
import 'package:tecblog/controller/ArticleInfoController.dart';

import '../component/my_colors.dart';

class ArticleInfo extends StatefulWidget {
  const ArticleInfo({super.key});

  @override
  State<ArticleInfo> createState() => _ArticleInfoState();
}

class _ArticleInfoState extends State<ArticleInfo> {
  ArticleInfoController articleInfoController = Get.put(ArticleInfoController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    articleInfoController.getArticleInfo(articleInfoController.id.value);
  }
  @override
  Widget build(BuildContext context) {
var size = MediaQuery.of(context).size;
    TextTheme theme= Theme.of(context).textTheme;
    return SafeArea(
      child: SingleChildScrollView(
        child: Scaffold(
          body: SizedBox(
height: size.height,
            width: size.width,
            child: Obx(

                ()=>Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: 300,
                    // height: MediaQuery.of(context).size.height/5,
                    // width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                       CachedNetworkImage(imageUrl: articleInfoController.articleinfo.value.image!,
                       imageBuilder: (context, imageProvider) => Container(
                         decoration: BoxDecoration(
                           image: DecorationImage(image: imageProvider),
                         ),
                       ),
                         placeholder: (context, url) => SpinKitChasingDots(),
                         errorWidget: (context, url, error) => Icon(Icons.image_not_supported),
                       ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: GradiantColors.articleInfo,begin: Alignment.topCenter , end: Alignment.bottomCenter),
                          ),
                          child: Row(
                            children: [
                              IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_outlined)),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border_outlined)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(children: [
                        Text(articleInfoController.articleinfo.value.title!),
                        Row(children: [
                          Icon(Icons.person),
                          Text(articleInfoController.articleinfo.value.author!),
                          Text(articleInfoController.articleinfo.value.created_at!),
                        ],),
                        Text(articleInfoController.articleinfo.value.content!),
                        Row(children: [
                          ListView.builder(itemBuilder: (context, index) {
                            MainTags(textTheme: theme, index: index,);
                          },)
                        ],),
                        Text(MyStrings.relatedArticle),
                        SizedBox(
                          width: 300,
                          height: 250,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              Container(
                                height: 250,
                                width: 300,
                                child: Row(children: [
                                  Stack(
                                    children: [
                                      cached_network_spinkit(articleInfoController.articleInfoRelated.value[index].related_image!, true, GradiantColors.relatedArticle),
                                      Text(articleInfoController.articleInfoRelated.value[index].related_author!),

                                    ],
                                  )
                                ],),
                              );
                            },
                          ),
                        ),
                      ],),
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
