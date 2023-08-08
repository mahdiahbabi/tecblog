import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tecblog/controller/ArticleInfoController.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controller/HomeScreenController.dart';
import '../gen/assets.gen.dart';

import 'my_colors.dart';


class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class MainTags extends StatelessWidget {
  MainTags({
    Key? key,
    required this.textTheme,
    required this.index,
  }) : super(key: key);

  final TextTheme textTheme;
  var index;
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(
            colors: GradiantColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Obx(
            ()=> Row(
            children: [
              ImageIcon(
                Assets.icons.hashtagicon.image().image,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                homeScreenController.tagsList[index].title,
                style: textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }
}


class MainTagInfo extends StatelessWidget {
  MainTagInfo({
    super.key,
    this.index,
    required this.articleInfoController,
    required this.theme,
  });

  final ArticleInfoController articleInfoController;
  final TextTheme theme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          gradient: LinearGradient(
              colors: GradiantColors.tags,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          child:  Row(
            children: [
              ImageIcon(
                Assets.icons.hashtagicon.image().image,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                articleInfoController.articleInfoTags.value[index].tags_title! ,
                style: theme.titleMedium,
              )
            ],
          ),

        ),
      ),
    );
  }
}




void gitHubUrl(String url) async {
  var Link = Uri.parse(url);

  if (await canLaunchUrl(Link)) {
    await launchUrl(Link);
  } else {
    log("the link dont work $Link");
  }
}

Widget spinkit(Color color) {
  return SpinKitFadingCube(
    color: color,
    size: 32,
  );
}


Widget cached_network_spinkit(String imageurl,bool foreground, List<Color> color){
  return CachedNetworkImage(imageUrl: imageurl,

    imageBuilder: (context,imageProvider){
      return Container(
        decoration: BoxDecoration(
          borderRadius:
           BorderRadius.all(Radius.circular(16)),

          image: DecorationImage(image: imageProvider,fit: BoxFit.cover,),),
        foregroundDecoration: foreground ==true ?  BoxDecoration(
            borderRadius:
            const BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: color ),
        ) : null

      );

    },
    placeholder: (context, url)=>spinkit(Colors.pink),
    errorWidget: (context , url , eror)=> const Icon(Icons.image_not_supported),
  );
}



Widget cached_network_spinkit_placeholder(String imageurl){
  return CachedNetworkImage(imageUrl: imageurl,
    placeholder: (context, url)=>spinkit(Colors.pink),
    errorWidget: (context , url , eror)=> const Icon(Icons.image_not_supported),
    imageBuilder: (context,imageProvider){
      return Container(
          decoration: BoxDecoration(

            borderRadius:
            const BorderRadius.all(Radius.circular(16)),

            image: DecorationImage(image: imageProvider,fit: BoxFit.cover,),),


      );

    },
  );
}
