


import 'package:flutter/material.dart';

import '../component/my_colors.dart';
import '../component/my_component.dart';
import '../component/my_string.dart';
import '../gen/assets.gen.dart';


class ProfileScreen extends StatelessWidget {

  const ProfileScreen({
    Key? key,
  
  }) : super(key: key);
 

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SingleChildScrollView(
     physics: const BouncingScrollPhysics(),
     child:Padding(
       padding: const EdgeInsets.only(top: 24
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
            Image(image: Assets.images.profileAvatar.image().image,height: 100,),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(Assets.icons.bluePen.image().image,color: SolidColors.seeMore,),
                const SizedBox(width: 8,),
                Text(
                  MyStrings.imageProfileEdit,
                  style: textTheme.headline3,
                )
              ],
            ),
            const SizedBox(height: 60,),
            Text("فاطمه امیری",style: textTheme.headline4,),
            Text("fatemeamiri@gmail.com",style: textTheme.headline4,),
            const SizedBox(height: 40,),
            TechDivider(size: size),
            InkWell(
              onTap: (() {
                //یه چیزی اجرا بشه
              }),
              splashColor: SolidColors.primeryColor,
              child: SizedBox(
                height: 45,
                child: Center(child: Text(MyStrings.myFavBlog ,style: textTheme.headline4,))),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: (() {
                //یه چیزی اجرا بشه
              }),
              splashColor: SolidColors.primeryColor,
              child: SizedBox(
                height: 45,
                child: Center(child: Text(MyStrings.myFavPodcast ,style: textTheme.headline4,))),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: (() {
                //یه چیزی اجرا بشه
              }),
              splashColor: SolidColors.primeryColor,
              child: SizedBox(
                height: 45,
                child: Center(child: Text(MyStrings.logOut ,style: textTheme.headline4,))),
            ),
            const SizedBox(height: 60,),

         ],
       ),
     )
     
     );
  }
}