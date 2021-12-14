import 'package:flutter/material.dart';

const verti_list = [
  {
    "title": "Recharge",
    "desc": "17 May",
    "amount": "- \u20B9 499",
    "time": "6:40 PM",
    "color1": Colors.red
  },
  {
    "title": "Jio",
    "desc": "26 May",
    "amount": "+ \u20B9 155",
    "time": "6:35 PM",
    "color1": Colors.green
  },
  {
    "title": "Airtel",
    "desc": "06 April",
    "amount": "- \u20B9 4,994",
    "time": "12:11 AM",
    "color1": Colors.red
  },
  {
    "title": "Vi",
    "desc": "01 May",
    "amount": "+ \u20B9 145",
    "time": "12:09 AM",
    "color1": Colors.green
  },
  {
    "title": "Docomo",
    "desc": "01 March",
    "amount": "- \u20B9 4,500",
    "time": "8:06 Am",
    "color1": Colors.red
  },
  {
    "title": "Bsnl",
    "desc": "07 August",
    "amount": "+ \u20B9 49",
    "time": "12:00 Am",
    "color1": Colors.green
  },
];

class MyVertiList extends StatefulWidget {
  const MyVertiList({Key? key}) : super(key: key);

  @override
  _MyVertiListState createState() => _MyVertiListState();
}

class _MyVertiListState extends State<MyVertiList> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: verti_list
            .map((e) => Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        _container_layout(
                            width,
                            "${e['title']}",
                            "${e['desc']}",
                            "${e['amount']}",
                            "${e['time']}",
                            e['color1'])
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

// what will be the look of the vertical container?
_container_layout(double width, String title, String desc, String amount,
    String time, var colo) {
  return Container(
    width: width,
    height: 60,
    child: Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple.withOpacity(0.3)),
              child: Icon(
                Icons.swap_horiz_sharp,
                color: Colors.white,
              ),
            )
          ],
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    amount,
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color: colo),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    desc,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
