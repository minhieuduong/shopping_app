import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shopping_app/controller/controllers.dart';
import 'package:my_shopping_app/view/home/components/popular_category/popular_category_loading.dart';
import 'package:my_shopping_app/view/home/components/section_title.dart';
import '../../components/main_header.dart';
import 'components/carousel_slider/carousel_loading.dart';
import 'components/popular_category/popular_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            const MainHeader(),
            Obx((){
              if(homeController.bannerList.isNotEmpty) {
                return CarouselSliderView(
                    bannerList: homeController.bannerList
                );
              } else {
                return Container();
              }
            }),
            const SectionTitle(title: "Hàng Phổ Biến"),
            Obx((){
              if(homeController.popularCategoryList.isNotEmpty) {
                return PopularCategory(
                  categories: homeController.popularCategoryList,

                );
              } else {
                return const PopularCategoryLoading();
              }
            }),
          ],
        )
    );
  }
}