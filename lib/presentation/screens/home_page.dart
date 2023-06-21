import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fotbal_project/domain/models/team.dart';
import 'package:fotbal_project/presentation/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:fotbal_project/presentation/blocs/home_page_bloc/home_page_events.dart';
import 'package:fotbal_project/presentation/blocs/home_page_bloc/home_page_state.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetIt.I<HomePageBloc>(),
        child: BlocConsumer<HomePageBloc, HomePageState>(
          listener: (context, state) {
            if (state is HomePageStateLoadingError) {
              _showErrorDialog(state.errorMessage);
            }
          },
          builder: (context, state) {
            if (state is HomePageStateLoading) {
              return const _LoadingScreenWidget();
            } else if (state is HomePageStateDataLoadedSuccess) {
              return _WinningTeamWidget(state.winningTeam);
            } else {
              return const _InitialStateWidget();
            }
          },
        ),
      ),
    );
  }

  Future<void> _showErrorDialog(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class _InitialStateWidget extends StatelessWidget {
  const _InitialStateWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.yellow,
        child: TextButton(
          onPressed: () {
            BlocProvider.of<HomePageBloc>(context).add(GetWinningTeam());
          },
          child: const Text('Get teams'),
        ),
      ),
    );
  }
}

class _WinningTeamWidget extends StatelessWidget {
  const _WinningTeamWidget(this.team);

  final Team? team;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(team != null
                ? team!.name
                : 'There was no data to determine a winner'),
          ],
        ),
      ),
    );
  }
}

class _LoadingScreenWidget extends StatelessWidget {
  const _LoadingScreenWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.lightGreen,
        child: const Text('Loading data....'),
      ),
    );
  }
}
