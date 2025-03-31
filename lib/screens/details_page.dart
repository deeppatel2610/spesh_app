import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spesh_app/provider/home_provider.dart';

import 'component/details_page_app_bar.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.run(() {
      context.read<HomeProvider>().alieBox();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/bg.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              detailsPageAppBar(context),
              Expanded(
                child: SizedBox(
                  child: AnimatedAlign(
                    duration: Duration(seconds: 2),
                    alignment:
                        (context.watch<HomeProvider>().isAlie)
                            ? Alignment.topCenter
                            : Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedContainer(
                            height: 300,
                            width: double.infinity,
                            duration: Duration(seconds: 2),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  context
                                      .watch<HomeProvider>()
                                      .solarSystemData[context
                                          .watch<HomeProvider>()
                                          .boxIndex]
                                      .gif!,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          AnimatedContainer(
                            duration: Duration(seconds: 2),
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color:
                                  context.watch<HomeProvider>().isAlie
                                      ? Colors.white10
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 5,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      detailsBoxMethod(
                                        context: context,
                                        title: 'Name : ',
                                        details:
                                            context
                                                .watch<HomeProvider>()
                                                .solarSystemData[context
                                                    .watch<HomeProvider>()
                                                    .boxIndex]
                                                .name!,
                                      ),
                                      detailsBoxMethod(
                                        context: context,
                                        title: 'Type : ',
                                        details:
                                            context
                                                .watch<HomeProvider>()
                                                .solarSystemData[context
                                                    .watch<HomeProvider>()
                                                    .boxIndex]
                                                .type!,
                                      ),

                                      detailsBoxMethod(
                                        context: context,
                                        title: 'Mass(KG) : ',
                                        details:
                                            context
                                                .watch<HomeProvider>()
                                                .solarSystemData[context
                                                    .watch<HomeProvider>()
                                                    .boxIndex]
                                                .mass_kg!
                                                .toString(),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      detailsBoxMethod(
                                        context: context,
                                        title: 'Gravity : ',
                                        details:
                                            context
                                                .watch<HomeProvider>()
                                                .solarSystemData[context
                                                    .watch<HomeProvider>()
                                                    .boxIndex]
                                                .gravity_m_s2!
                                                .toString(),
                                      ),
                                      detailsBoxMethod(
                                        context: context,
                                        title: 'Diameter(KM) : ',
                                        details:
                                            context
                                                .watch<HomeProvider>()
                                                .solarSystemData[context
                                                    .watch<HomeProvider>()
                                                    .boxIndex]
                                                .diameter_km!
                                                .toString(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      detailsBoxMethod(
                                        context: context,
                                        title: 'Orbital period days : ',
                                        details:
                                            context
                                                .watch<HomeProvider>()
                                                .solarSystemData[context
                                                    .watch<HomeProvider>()
                                                    .boxIndex]
                                                .orbital_period_days!
                                                .toString(),
                                      ),
                                      detailsBoxMethod(
                                        context: context,
                                        title: 'Distance sun(KM) : ',
                                        details:
                                            context
                                                .watch<HomeProvider>()
                                                .solarSystemData[context
                                                    .watch<HomeProvider>()
                                                    .boxIndex]
                                                .distance_from_sun_km!
                                                .toString(),
                                      ),
                                    ],
                                  ),

                                  detailsBoxMethod(
                                    context: context,
                                    title: 'Description : ',
                                    details:
                                        context
                                            .watch<HomeProvider>()
                                            .solarSystemData[context
                                                .watch<HomeProvider>()
                                                .boxIndex]
                                            .description!,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column detailsBoxMethod({
    required BuildContext context,
    required String title,
    required String details,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
            letterSpacing: .5,
          ),
        ),
        Text(
          details,
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            letterSpacing: .5,
          ),
        ),
      ],
    );
  }
}
