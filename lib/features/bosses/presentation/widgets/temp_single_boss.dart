import 'package:flutter/material.dart';

import '../../../../constants/my_colors.dart';
import '../../domain/entities/bosses_entities.dart';

class TempSingleBoss extends StatelessWidget {
  final BossesEntities bosses;
  const TempSingleBoss({super.key, required this.bosses});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridTile(
        header: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: MyColors.buttonText.withOpacity(0.5),
          alignment: Alignment.topCenter,
          child: Text(
            bosses.data[0].name,
            style: const TextStyle(
              height: 1.3,
              fontSize: 16,
              color: MyColors.paragraph,
              fontWeight: FontWeight.bold,
            ),
            //If the text is big the remaining text will be in dots
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        footer: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: MyColors.buttonText,
          alignment: Alignment.bottomCenter,
          child: Text(
            bosses.data[2].description,
            style: const TextStyle(
              height: 1.3,
              fontSize: 16,
              color: MyColors.paragraph,
              fontWeight: FontWeight.bold,
            ),
            //If the text is big the remaining text will be in dots
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Column(
          children: [
            Container(
              color: MyColors.tertiary,
              child: bosses.data[1].image.toString().isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'images/loading_sword.gif',
                      image: bosses.data[1].image.toString(),
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/image/placeholder.png'),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
