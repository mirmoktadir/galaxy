import 'package:flutter/material.dart';
import 'package:galaxy/app/modules/auth/controllers/auth_controller.dart';
import 'package:galaxy/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';

import 'mir_custome_painter.dart';

//ignore: must_be_immutable
class BottomNavbar extends GetView {
  BottomNavbar({Key? key}) : super(key: key);
  final authController = Get.put(AuthController());
  List navigation = [
    HomeView(),
    // const Page2View(),
    // const Page3View(),
    // const ProfileView(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    void onTap(int index) {
      _selectedIndex = index;

      (context as Element).markNeedsBuild();
    }

    return Scaffold(
      body: navigation[_selectedIndex],
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          onPressed: () async {
            // test
            await authController.doLogout();
          },
          backgroundColor: theme.primaryColor,
          elevation: 5,
          child: const Icon(
            Icons.add_shopping_cart_outlined,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        color: theme.primaryColor.withOpacity(.2),
        child: CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 70),
          painter: MIRCustomPainter(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  enableFeedback: false,
                  padding: EdgeInsets.zero,
                  minWidth: 50,
                  splashColor: theme.primaryColor.withOpacity(.4),
                  onPressed: () {
                    onTap(0);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _selectedIndex == 0
                            ? IconlyLight.home
                            : IconlyLight.home,
                        color: _selectedIndex == 0
                            ? theme.primaryColor
                            : Colors.grey.shade400,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: _selectedIndex == 0
                              ? theme.primaryColor
                              : Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  enableFeedback: false,
                  padding: EdgeInsets.zero,
                  minWidth: 50,
                  splashColor: theme.primaryColor.withOpacity(.4),
                  onPressed: () {
                    onTap(1);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _selectedIndex == 1 ? Iconsax.tag : Iconsax.tag,
                        color: _selectedIndex == 1
                            ? theme.primaryColor
                            : Colors.grey.shade400,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Page2',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: _selectedIndex == 1
                              ? theme.primaryColor
                              : Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                MaterialButton(
                  enableFeedback: false,
                  padding: EdgeInsets.zero,
                  minWidth: 50,
                  splashColor: theme.primaryColor.withOpacity(.4),
                  onPressed: () {
                    onTap(2);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.card,
                        size: 20,
                        color: _selectedIndex == 2
                            ? theme.primaryColor
                            : Colors.grey.shade400,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Page3',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: _selectedIndex == 2
                              ? theme.primaryColor
                              : Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  enableFeedback: false,
                  padding: EdgeInsets.zero,
                  minWidth: 50,
                  splashColor: theme.primaryColor.withOpacity(.4),
                  onPressed: () {
                    onTap(3);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconlyLight.profile,
                        size: 20,
                        color: _selectedIndex == 3
                            ? theme.primaryColor
                            : Colors.grey.shade400,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: _selectedIndex == 3
                              ? theme.primaryColor
                              : Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
