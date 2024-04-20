import 'package:elden_ring_cl/features/bosses/domain/entities/bosses_entities.dart';
import 'package:flutter/material.dart';

import '../../../../constants/my_colors.dart';

class BossItem extends StatelessWidget {
  final BossesEntities bosses;

  const BossItem({super.key, required this.bosses});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.button,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        header: Container(
          width: double.infinity,
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
          width: double.infinity,
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
                      placeholder: 'assets/images/loading_sword.gif',
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
