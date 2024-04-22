import 'package:elden_ring_cl/features/bosses/data/models/bosses_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/my_colors.dart';
import '../../../../injection_container.dart';
import '../bloc/bosses_bloc.dart';
import '../widgets/boss_item.dart';
import '../widgets/loading_widget.dart';
import '../widgets/message_display.dart';

class BossesScreen extends StatefulWidget {
  const BossesScreen({super.key});

  @override
  State<BossesScreen> createState() => _BossesScreenState();
}

class _BossesScreenState extends State<BossesScreen> {
  //late List<BossesEntities> all bosses -> this what I used before
  late List<BossesModel> allBosses;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<BossesBloc>(context).add(GetForBosses());
  }

  //To display allBosses list.
  Widget buildBossesList() {
    return GridView.builder(
        //The grid and all it's properties
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: allBosses.length,
        itemBuilder: (context, index) {
          return BossItem(
            bosses: allBosses[index],
          );
        });
  }

  //To return the built grid with the characters in a SingleChildScrollView.
  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.backGround,
        child: Column(
          children: [
            buildBossesList(),
          ],
        ),
      ),
    );
  }

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
                  if (state is Loading) {
                    return const LoadingWidget();
                  } else if (state is Loaded) {
                    return buildLoadedListWidget();
                  } else if (state is Error) {
                    return MessageDisplay(message: state.message);
                  }
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: const Placeholder(),
                  );

                  /*
                  if (state is Loaded) {
                    allBosses = (state).bosses as List<BossesEntities>;
                    return buildLoadedListWidget();
                  }
                  return SizedBox();

                   */
                },
              ),
              //const SizedBox(height: 20),
              //const BossesControls(),
            ],
          ),
        ),
      ),
    );
  }
}
