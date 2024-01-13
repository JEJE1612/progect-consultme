import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/Allconslatme.dart';
import 'package:flutter_application_1/core/utils/assets.dart';

class ItemsListCatroies extends StatelessWidget {
  const ItemsListCatroies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AllConaltant(),
            ));
      },
      child: Image.asset(
        AssetsData.logo,
        fit: BoxFit.cover,
      ),
      // child: Container(
      //   margin: const EdgeInsets.symmetric(horizontal: 10),
      //   padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(12),
      //     image: const DecorationImage(
      //       image: AssetImage(
      //         AssetsData.logo,
      //       ),
      //     ),
      //   ),
      //   child: Row(
      //     children: [
      //       const SizedBox(
      //         width: 35,
      //       ),
      //       Text(
      //         "Theather",
      //         maxLines: 2,
      //         overflow: TextOverflow.ellipsis,
      //         style: Styles.textStyle20.copyWith(
      //           color: Color(0xff060E1E),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
