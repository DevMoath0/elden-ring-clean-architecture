import 'package:elden_ring_cl/features/bosses/domain/entities/bosses.dart';
import 'package:elden_ring_cl/features/bosses/presentation/widgets/bosses_display.dart';
import 'package:elden_ring_cl/features/bosses/presentation/widgets/loading_widget.dart';
import 'package:elden_ring_cl/features/bosses/presentation/widgets/message_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/bosses_bloc.dart';
import '../widgets/bosses_controls.dart';

class BossesScreen extends StatelessWidget {
  const BossesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boss'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}

BlocProvider<BossesBloc> buildBody(BuildContext context) {
  return BlocProvider(
    create: (_) => serviceLocator<BossesBloc>(),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            BlocBuilder<BossesBloc, BossesState>(
              builder: (context, state) {
                if (state is Empty) {
                  return const MessageDisplay(message: 'Start Searching!');
                } else if (state is Loading) {
                  return const LoadingWidget();
                } else if (state is Loaded) {
                  return BossesDisplay(bosses: state.bosses);
                } else if (state is Error) {
                  return MessageDisplay(message: state.message);
                }
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: const Placeholder(),
                );
              },
            ),
            const SizedBox(height: 20),
            const BossesControls()
          ],
        ),
      ),
    ),
  );
}
