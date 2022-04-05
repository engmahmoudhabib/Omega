import 'package:flutter/material.dart';
import 'package:omega/core/statics/assets_paths.dart';

class AnimatedItem extends StatelessWidget {
  final String data;
  final Animation<double>? animation;
  final bool hasBanner;
  const AnimatedItem(this.data, {this.animation ,required this.hasBanner
  ,});

  @override
  Widget build(BuildContext context) {
    Widget result = Container(
      height: 155,
      margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: hasBanner == false ? Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Card(
              elevation: 4,
              child: Image.asset(
                AssetsPaths.appIcon,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Course Name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Text(
                    'Tutor :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Ali Habib',
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    'Start :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '1-5-2022',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    'End :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '1-7-2022',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    'Cost :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '10000 SYP',
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    'Available :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '10',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    'Sits :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '20',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ],
          )
        ],
      ) :
      Banner(
                message: "20% off !!",
                location: BannerLocation.topEnd,
                color: Colors.red, child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Card(
              elevation: 4,
              child: Image.asset(
                AssetsPaths.appIcon,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Course Name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Text(
                    'Tutor :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Ali Habib',
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    'Start :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '1-5-2022',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    'End :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '1-7-2022',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    'Cost :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '10000 SYP',
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    'Available :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '10',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    'Sits :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '20',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ],
          )
        ],
      ) ,),
    );
    if (animation != null) {
      return FadeTransition(
        opacity: animation!,
        child: result,
      );
    }
    return result;
  }
}
