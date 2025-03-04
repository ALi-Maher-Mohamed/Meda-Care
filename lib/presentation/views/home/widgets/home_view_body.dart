import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:media_care/presentation/views/pharmacies/data/service/pharmacy_service.dart';
import 'package:media_care/presentation/views/pharmacies/manager/cubit/pharmacy_cubit.dart';
import 'package:media_care/presentation/views/pharmacies/pharmacy_view.dart';
import '../../../../core/utils/app_color.dart';
import '../../Laboratories/Labs_view.dart';
import '../../Laboratories/data/services/laps_service.dart';
import '../../Laboratories/manager/cubit/labs_cubit.dart';
import 'wrap_container_home.dart';
import '../../search/search_view.dart';
import 'home_pharmacy_list_view.dart';
import 'search_doctor_field.dart';
import 'home_view_headr.dart';
import 'title_and_see_all.dart';

import 'home_view_header_card.dart';

class HomeViewBody extends StatefulWidget {
  HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  // late List<PharmacyModel> pharmacies;
  int selectedIndex = 0;
  final bottomNavigationKey = GlobalKey<CurvedNavigationBarState>();
  List<Widget> items = [
    Icon(
      Icons.home,
      size: 30,
      color: AppColors.darkGrey,
    ),
    FaIcon(
      FontAwesomeIcons.hospital,
      color: AppColors.darkGrey,
      size: 30,
    ),
    Icon(
      FontAwesomeIcons.flask,
      size: 30,
      color: AppColors.darkGrey,
    ),
    Icon(
      Icons.search,
      size: 30,
      color: AppColors.darkGrey,
    ),
    Icon(
      Icons.person,
      size: 30,
      color: AppColors.darkGrey,
    ),
  ];
  List<Widget> widgetOptions = <Widget>[
    HomeViewBodyScreen(),
    BlocProvider(
      create: (context) =>
          PharmacyCubit(PharmacyService())..fetchPharmacies(isNextPage: false),
      child: PharmacyView(),
    ),
    BlocProvider(
      create: (context) =>
          LaboratoryCubit(LaboratoryService())..fetchLaboratories(),
      child: LaboratoryView(),
    ),
    SearchView(),
    Center(child: Text('Profile')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
          animationDuration: Duration(milliseconds: 250),
          key: bottomNavigationKey,
          backgroundColor: Colors.white,
          color: AppColors.primaryLight,
          height: MediaQuery.of(context).size.height * 0.06,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          index: selectedIndex,
          items: items),
      body: widgetOptions[selectedIndex],
    );
  }
}

class HomeViewBodyScreen extends StatelessWidget {
  const HomeViewBodyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeViewHeader(),
              HomeViewHeaderCard(),
              SizedBox(
                height: 24,
              ),
              SearchDoctor()
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        CustomWrapContainersHomeView(),
        SizedBox(
          height: 12,
        ),
        Column(
          children: [
            TitleAndSeeAll(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BlocProvider(
                    create: (context) => PharmacyCubit(PharmacyService())
                      ..fetchPharmacies(isNextPage: false),
                    child: PharmacyView(),
                  );
                }));
              },
              text: 'افضل الصيدليات ',
            ),
            SizedBox(
              height: 12,
            ),
            BlocProvider(
              create: (context) {
                return PharmacyCubit(PharmacyService())..fetchPharmacies();
              },
              child: PharmacyListView(),
            ),
          ],
        ),
      ]),
    );
  }
}
