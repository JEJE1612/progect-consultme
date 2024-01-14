import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/Allconslatme.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/ChatSceen/ChatDeatiles.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Setting/views/Editprofail.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class GradViewBuilderAdmin extends StatelessWidget {
  const GradViewBuilderAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AllConaltant(),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(
                  AssetsData.logo,
                ),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
            ),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Teather ",
                  style: Styles.textStyle18.copyWith(color: Colors.white),
                )),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Row(
              children: [
                const SizedBox(width: 5),
                Material(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(50),
                  child: PopupMenuButton<String>(
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'update',
                        child: Row(
                          children: [
                            Icon(Icons.edit),
                            SizedBox(width: 5),
                            Text('update'),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfail(),
                          ),
                        );
                      } else if (value == 'Chat') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => chatDeatiles(),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
