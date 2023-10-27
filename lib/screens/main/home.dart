import 'package:dog_finder/common/theme/styles_manager.dart';
import 'package:dog_finder/screens/main/main_entry.dart';
import 'package:dog_finder/screens/main/widgets/carousel_slider.dart';
import 'package:dog_finder/screens/main/widgets/drawer_opener.dart';
import 'package:dog_finder/screens/main/widgets/flutter_toast.dart';
import 'package:dog_finder/screens/main/components/home_sliver_grid_view.dart';
import 'package:dog_finder/screens/main/widgets/kdot_indicator.dart';
import 'package:dog_finder/screens/main/widgets/row_text.dart';
import 'package:dog_finder/screens/main/widgets/single_dog_type_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/models/dog_type.dart';
import '../../constants/app_colors.dart';
import '../../constants/enums/status.dart';
import '../../controllers/carousel_slider/carousel_slider_cubit.dart';
import '../../gen/assets.gen.dart';
import 'components/drawer.dart';
import 'components/search_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  void setFilter() {
    // Todo set filter
    toastInfo(
      msg: 'Clicked on Filter',
      status: Status.success,
    );
  }

  void seeAllDogs() {
    // Todo see all courses
    toastInfo(
      msg: 'Clicked on See All Dogs',
      status: Status.success,
    );
  }

  void carouselContinueFnc() {
    // Todo carousel continue fnc
    toastInfo(
      msg: 'Clicked on Carousel Continue',
      status: Status.success,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 40.w,
          leading: drawerOpener(context: context),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Container(
                width: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(Assets.images.avatar.path),
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: const DrawerComponent(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18.0,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Sarah Doe!',
                          style: getLightStyle(
                            fontSize: 23.sp,
                            color: AppColors.primaryThreeElementText,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Welcome to Dog Finder',
                          style: getBoldStyle(
                            color: Colors.black,
                            fontSize: 25.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: SearchSection(
                      size: size,
                      searchController: searchController,
                      setFilter: setFilter,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<CarouselSliderCubit, CarouselSliderState>(
                    builder: (context, state) => Column(
                      children: [
                        KCarouselSlider(
                          carouselSliders: state.carouselSliders,
                          setCurrentCarouselIndex: context
                              .read<CarouselSliderCubit>()
                              .setCurrentCarouselIndex,
                          carouselContinueFnc: carouselContinueFnc,
                        ),
                        const SizedBox(height: 10),
                        KDotsIndicator(
                          currentCarouselIndex: state.currentCarouselIndex,
                          carouselSliders: state.carouselSliders,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RowText(
                          title: 'Select your type',
                          actionText: 'See all',
                          actionHandler: seeAllDogs,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
            ),
            HomeSliverGridView()
          ],
        ),
      ),
    );
  }
}
