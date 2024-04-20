import 'package:elden_ring_cl/features/bosses/domain/entities/bosses_entities.dart';
import 'package:elden_ring_cl/features/bosses/presentation/widgets/boss_item.dart';
import 'package:flutter/material.dart';

class BossesDisplay extends StatelessWidget {
  final BossesEntities bosses;

  const BossesDisplay({super.key, required this.bosses});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: Column(
          children: [
            BossItem(bosses: bosses),
            //BossesControls(),
          ],
        ),
      ),
    );
  }
}
