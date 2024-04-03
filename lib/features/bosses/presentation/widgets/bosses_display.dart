import 'package:elden_ring_cl/features/bosses/presentation/widgets/boss_item.dart';
import 'package:elden_ring_cl/features/bosses/presentation/widgets/bosses_controls.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/bosses.dart';

class BossesDisplay extends StatelessWidget {
  final Bosses bosses;

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
