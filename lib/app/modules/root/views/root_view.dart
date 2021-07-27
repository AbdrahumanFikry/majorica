import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/modules/account/views/account_view.dart';
import 'package:majorica/app/modules/home/views/home_view.dart';
import 'package:majorica/app/modules/reservations/views/reservations_view.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  final List<Map<String, dynamic>> tabs = [
    {
      'title': S.current.home,
      'icon': Icons.house_outlined,
      'activeIcon': Icons.house,
      'page': HomeView(),
    },
    {
      'title': S.current.reservations,
      'icon': Icons.book_outlined,
      'activeIcon': Icons.book,
      'page': ReservationsView(),
    },
    {
      'title': S.current.account,
      'icon': Icons.person_outline_outlined,
      'activeIcon': Icons.person,
      'page': MyAccountView(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return GlobalScaffold(
          body: tabs[controller.currentPage.value]['page'],
          bottomNavigationBar: Directionality(
            textDirection: TextDirection.ltr,
            child: AnimatedBottomNavigationBar.builder(
              splashSpeedInMilliseconds: 0,
              backgroundColor: ColorUtil.whiteScaffold,
              itemCount: tabs.length,
              tabBuilder: (int index, bool selected) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Icon(
                          controller.currentPage.value == index
                              ? tabs[index]['activeIcon']
                              : tabs[index]['icon'],
                          color: selected
                              ? ColorUtil.primaryColor
                              : ColorUtil.mediumGrey,
                          size: 30.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      FittedBox(
                        child: Text(
                          tabs[index]['title']!.toString(),
                          style: AppUtil.textStyle(
                            color: selected
                                ? ColorUtil.primaryColor
                                : ColorUtil.mediumGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              activeIndex: controller.currentPage.value,
              gapLocation: GapLocation.none,
              notchSmoothness: NotchSmoothness.defaultEdge,
              onTap: (index) {
                print(index);
                controller.currentPage(index);
              },
            ),
          ),
        );
      },
    );
  }
}
