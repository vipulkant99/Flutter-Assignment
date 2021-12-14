import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

const hori_list = [
  {
    "title": "Mobile Home Dealers",
    "desc": "Last Payment 17 May",
    "amount": "4000",
    "percent": "85",
    "color1": Colors.orange,
    "color2": Colors.amber
  },
  {
    "title": "Taxicabs And Limousnes",
    "desc": "Last Payment 26 May",
    "amount": "449",
    "percent": "75",
    "color1": Colors.purple,
    "color2": Colors.purpleAccent
  },
  {
    "title": "Miscellaneous Appreal",
    "desc": "Last Payment 06 April",
    "amount": "245",
    "percent": "66",
    "color1": Colors.red,
    "color2": Colors.redAccent
  },
  {
    "title": "Electric And Gas",
    "desc": "Last Payment 01 May",
    "amount": "145",
    "percent": "5",
    "color1": Colors.green,
    "color2": Colors.greenAccent
  },
  {
    "title": "Misc and General",
    "desc": "Last Payment 01 March",
    "amount": "500",
    "percent": "10",
    "color1": Colors.blue,
    "color2": Colors.lightBlue
  },
  {
    "title": "Transportation",
    "desc": "Last Payment 07 August",
    "amount": "8000",
    "percent": "100",
    "color1": Colors.purple,
    "color2": Colors.purpleAccent
  },
];

class MyHoriList extends StatefulWidget {
  const MyHoriList({Key? key}) : super(key: key);

  @override
  _MyHoriListState createState() => _MyHoriListState();
}

class _MyHoriListState extends State<MyHoriList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeLeft: true,
        removeRight: true,
        removeTop: true,
        child: Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: hori_list
                .map((e) => Container(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            _full_designed_container(
                                "${e['title']}",
                                "${e['desc']}",
                                "${e['amount']}",
                                "${e['percent']}",
                                e['color1'],
                                e['color2'])
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

// Using for animating the grid
_animation_grid(String percent, var colors1) {
  double perc = double.parse(percent);
  double actual = ((perc * 28) / 100);
  int usingvalue = 28 - actual.floor();
  //print(usingvalue);
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: AnimationLimiter(
      child: GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 2,
              childAspectRatio: 1 / 0.77),
          children: [
            for (int i = 0; i < 28; i++)
              AnimationConfiguration.staggeredGrid(
                columnCount: 4,
                position: i,
                duration: const Duration(milliseconds: 1000),
                child: SlideAnimation(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: i < usingvalue
                        ? Container(
                            color: Colors.transparent,
                          )
                        : Container(color: colors1),
                  ),
                ),
              )
          ]),
    ),
  );
}

// what will be the look of the horizontal container?
_filled_container(String title, String desc, String amount, String percent) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                desc,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\u20B9" + amount,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    percent + "%",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}

// Main container where both animated and information containg container is showed
_full_designed_container(String title, String desc, String amount,
    String percent, var color1, var color2) {
  return Container(
      height: 210,
      width: 160,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color1),
      child: Stack(
        children: [
          _animation_grid(percent, color2),
          _filled_container(title, desc, amount, percent),
        ],
      ));
}
