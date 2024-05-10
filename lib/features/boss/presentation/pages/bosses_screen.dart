import 'package:elden_ring_cl/features/boss/presentation/bloc/home_bosses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/message_display.dart';
import '../../../../injection_container.dart';
import '../widgets/boss_card.dart';

class BossesScreen extends StatefulWidget {
  const BossesScreen({super.key});

  @override
  State<BossesScreen> createState() => _BossesScreenState();
}

class _BossesScreenState extends State<BossesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boss'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: buildBody(context),
    );
  }

  Container buildBody(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (_) => serviceLocator<HomeBossesBloc>(),
        child: BlocBuilder<HomeBossesBloc, HomeBossesState>(
          builder: (context, state) {
            return currentStateWidget(context, state);
          },
        ),
      ),
    );
  }

  Widget currentStateWidget(BuildContext context, HomeBossesState state) {
    if (state is Init) {
      BlocProvider.of<HomeBossesBloc>(context).add(GetBossesEvent());
      return Container();
    } else if (state is Empty) {
      return const MessageDisplay(
        message: 'No result available!',
      );
    } else if (state is Loading) {
      return const LoadingWidget();
    } else if (state is Loaded) {
      final bosses = state.bosses;
      return ListView.builder(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
          shrinkWrap: true,
          itemCount: bosses.length,
          itemBuilder: (BuildContext context, int index) {
            return BossCard(bosses[index]);
          });
    } else if (state is Error) {
      return MessageDisplay(
        message: state.message,
      );
    } else {
      return Container();
    }
  }
}
