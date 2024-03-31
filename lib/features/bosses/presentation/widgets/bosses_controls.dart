import 'package:elden_ring_cl/features/bosses/presentation/bloc/bosses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BossesControls extends StatefulWidget {
  const BossesControls({
    super.key,
  });

  @override
  State<BossesControls> createState() => _BossesControlsState();
}

class _BossesControlsState extends State<BossesControls> {
  final controller = TextEditingController();

  late String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: dispatchRandom,
                child: const Text('Get random Trivia'),
              ),
            ),
          ],
        )
      ],
    );
  }

  void dispatchRandom() {
    BlocProvider.of<BossesBloc>(context).add(GetForBosses());
  }
}
