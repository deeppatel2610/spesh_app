import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

Row detailsPageAppBar(BuildContext context) {
  return Row(
    children: [
      SizedBox(width: 10),
      IconButton(
        onPressed: () {
          Navigator.of(context).pop();
          context.read<HomeProvider>().alieBox();
        },
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
      ),
      SizedBox(width: 10),
      Text(
        context
            .watch<HomeProvider>()
            .solarSystemData[context.watch<HomeProvider>().boxIndex]
            .name!,
        style: TextStyle(
          color: Colors.white,
          letterSpacing: .5,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    ],
  );
}
