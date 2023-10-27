import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants/app_colors.dart';
import 'home.dart';
import 'dog_pages/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainEntryScreen extends StatefulWidget {
  const MainEntryScreen({
    super.key,
    this.pageIndex = 0,
  });

  final int pageIndex;

  @override
  State<MainEntryScreen> createState() => _MainEntryScreenState();
}

class _MainEntryScreenState extends State<MainEntryScreen> {

  var _pageIndex = 0;
  final List<Widget> _pages = const [
    HomeScreen(),
    DogBreedRandomScreen(),
    DogBreedImageListScreen(),
    DogBreedSubBreedRandomScreen(),
    DogBreedSubBreedImageListScreen(),
  ];

  void setNewPage(int page) {
    setState(() {
      _pageIndex = page;
    });
  }



  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setState(() {
      _pageIndex = widget.pageIndex;
    });
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.primaryColor,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: AppColors.primaryColor,
        activeColor: Colors.white,
        style: TabStyle.reactCircle,
        initialActiveIndex: _pageIndex,
        items: [
          buildTabItem(CupertinoIcons.home, 0),
          buildTabItem(FontAwesomeIcons.dog, 1),
          buildTabItem(Icons.pets, 2),
          buildTabItem(FontAwesomeIcons.dog, 3),
          buildTabItem(Icons.pets, 4),
        ],
        onTap: setNewPage,
      ),
      body: _pages[_pageIndex],
    );
  }

  // custom tab item
  TabItem<dynamic> buildTabItem(IconData icon, int pageIndex) {
    return TabItem(
      icon: Icon(
        icon,
        color: _pageIndex == pageIndex
            ? AppColors.secondaryColor
            : AppColors.primaryFourElementText,
        size: _pageIndex == pageIndex ? 40 : 25,
      ),
    );
  }
}
