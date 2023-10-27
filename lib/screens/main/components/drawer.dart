import 'dart:io';
import 'package:dog_finder/screens/main/widgets/flutter_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/models/drawer_menu.dart';
import '../../../common/theme/font_manager.dart';
import '../../../common/theme/styles_manager.dart';
import '../../../constants/enums/status.dart';
import '../../../gen/assets.gen.dart';
import '../widgets/drawer_menu_list_tile.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  void goToMyDogs() {
    // Todo go to my dogs
    toastInfo(
      msg: 'Clicked on My Dogs',
      status: Status.success,
    );
  }

  void goToMyProfile() {
    // Todo go to profile
    toastInfo(
      msg: 'Clicked on My Profile',
      status: Status.success,
    );
  }

  void goToWishList() {
    // Todo go to Wish List
    toastInfo(
      msg: 'Clicked on Wishlist',
      status: Status.success,
    );
  }

  void goToNotifications() {
    // Todo go to Notifications
    toastInfo(
      msg: 'Clicked on Notifications',
      status: Status.success,
    );
  }

  @override
  Widget build(BuildContext context) {
    // drawer menu list
    final List<DrawerMenu> drawerMenus = [
      DrawerMenu(
        title: 'My Profile',
        icon: Platform.isAndroid ? Icons.person_outline : CupertinoIcons.person,
        actionHandler: goToMyProfile,
      ),
      DrawerMenu(
        title: 'My Dogs',
        icon: Icons.pets,
        actionHandler: goToMyDogs,
      ),
      DrawerMenu(
        title: 'Notifications',
        icon: Platform.isAndroid
            ? Icons.notifications_active_outlined
            : CupertinoIcons.bell,
        actionHandler: goToNotifications,
      ),
      DrawerMenu(
        title: 'Wish List',
        icon: CupertinoIcons.heart_fill,
        actionHandler: goToWishList,
      ),
    ];

    return Drawer(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () => Scaffold.of(context).closeDrawer(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Assets.icons.menu.path,
                          width: 20.w,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 90.h,
              width: 120.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    Assets.images.avatar.path,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Sarah Doe',
              style: getMediumStyle(
                color: Colors.black,
                fontSize: FontSize.s16,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'sarahdoe@gmail.com',
              style: getRegularStyle(
                color: Colors.black,
                fontSize: FontSize.s14,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.h,
              child: ListView.builder(
                itemCount: drawerMenus.length,
                itemBuilder: (context, index) {
                  var menu = drawerMenus[index];

                  return GestureDetector(
                    onTap: () => menu.actionHandler(),
                    child: DrawerMenuListTile(menu: menu),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
