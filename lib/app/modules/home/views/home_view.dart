import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxy/app/modules/auth/controllers/auth_controller.dart';
import 'package:galaxy/config/theme/my_fonts.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final authController = Get.put(AuthController());
  final TextEditingController searchController = TextEditingController();
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Galaxy',
            style: TextStyle(color: theme.primaryColor),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 78.h),
                    _carouselSlider(context, theme),
                    _itemList(theme, "Top Products", () {}),
                    const SizedBox(height: 5),
                    _itemList(theme, "Accessories", () {}),
                  ],
                ),
              ),
              _searchbar(theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemList(ThemeData theme, String title, VoidCallback function) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: MyFonts.headline6TextSize,
                color: theme.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(120, 40),
                alignment: Alignment.centerRight,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: function,
              child: Text(
                "View All >",
                style: TextStyle(
                  fontSize: MyFonts.headline6TextSize,
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 200.h,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    height: 140.h,
                    width: 125.w,
                    imageUrl: controller.products[index].image.toString(),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                          width: 1,
                          color: theme.primaryColor.withOpacity(.3),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Item 1",
                    style: TextStyle(
                      fontSize: MyFonts.headline6TextSize,
                      // color: theme.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "\$ 120.00",
                    style: TextStyle(
                      fontSize: MyFonts.body1TextSize,
                      color: Colors.black45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, _) {
              return const SizedBox(width: 10);
            },
          ),
        ),
      ],
    );
  }

  Widget _searchbar(ThemeData theme) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 25.h),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 58.h,
              child: Center(
                child: TextFormField(
                  controller: searchController,
                  obscureText: false,
                  onSaved: (value) {
                    searchController.text = value!;
                  },
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  cursorColor: theme.primaryColor,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      left: 15,
                    ),
                    hintText: "Search anything",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: theme.hintColor.withOpacity(.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        width: 1,
                        color: theme.primaryColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        width: 1,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          SizedBox(
            height: 58.h,
            width: 58.w,
            child: ElevatedButton(
              onPressed: () {},
              child: const Icon(
                IconlyLight.search,
                // size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _carouselSlider(BuildContext context, ThemeData theme) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: controller.imgList.length,
          carouselController: _controller,
          itemBuilder: (context, index, __) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(controller.imgList[index].toString()),
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              controller.current = index;
              (context as Element).markNeedsBuild();
            },
            height: 168.h,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(seconds: 3),
            autoPlayCurve: Curves.easeInOutBack,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            initialPage: 2,
            pageSnapping: true,
            viewportFraction: .9,
            enlargeFactor: .3,
            autoPlayInterval: const Duration(
              seconds: 4,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: controller.imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 6.0,
                height: 6.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : theme.primaryColor)
                        .withOpacity(
                            controller.current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
