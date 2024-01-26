import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Card buildRewiItems(BuildContext context) {
  // var size = MediaQuery.of(context).size;
  return const Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    elevation: 20.0,
    //color: Colors.white,
    child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            RaterImage(),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "AhmedMohmed",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      RatingIcon(),
                    ],
                  ),
                ],
              ),
            ),
            EditRate()
          ],
        ),
        RateDescribetion()
      ],
    ),
  );
}

class EditRate extends StatelessWidget {
  const EditRate({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'update',
          child: Row(
            children: [
              Icon(Icons.edit),
              SizedBox(width: 5),
              Text('Update'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'remove',
          child: Row(
            children: [
              Icon(Icons.delete),
              SizedBox(width: 5),
              Text('Remove'),
            ],
          ),
        ),
      ],
      onSelected: (value) {
        // Handle selection here
        if (value == 'update') {
        } else if (value == 'remove') {}
      },
    );
  }
}

class RatingIcon extends StatelessWidget {
  const RatingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
      ],
    );
  }
}

class RateDescribetion extends StatelessWidget {
  const RateDescribetion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
          style: TextStyle(
            fontSize: 14,
            height: 1.2,
            textBaseline: TextBaseline.ideographic,
          ),
        ),
      ),
    );
  }
}

class RaterImage extends StatelessWidget {
  const RaterImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundImage: AssetImage(
        AssetsData.testImage,
      ),
      radius: 25,
    );
  }
}
