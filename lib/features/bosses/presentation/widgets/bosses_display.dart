import 'package:flutter/material.dart';

import '../../domain/entities/bosses.dart';

class BossesDisplay extends StatelessWidget {
  final Bosses bosses;

  const BossesDisplay({super.key, required this.bosses});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: Column(
          children: [
            Text(
              bosses.name,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Text(
                    bosses.description,
                    style: const TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
