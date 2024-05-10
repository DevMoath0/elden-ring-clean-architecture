import 'package:cached_network_image/cached_network_image.dart';
import 'package:elden_ring_cl/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/boss.dart';

class BossCard extends StatefulWidget {
  final Boss boss;

  const BossCard(
    this.boss, {
    super.key,
  });

  @override
  _BossCardState createState() => _BossCardState();
}

class _BossCardState extends State<BossCard> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final boss = widget.boss;
    const imageRatio = 16 / 9;
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: imageRatio,
              child: CachedNetworkImage(
                imageUrl: boss.image,
                fit: BoxFit.cover,
                placeholder: (context, url) => const LoadingWidget(),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/error.png',
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(boss.name),
              ),
            )
          ],
        ),
      ),
    );
  }
}
