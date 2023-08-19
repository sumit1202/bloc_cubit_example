import 'package:bloc_cubit_example/cubits/internet_cubit.dart';
import 'package:bloc_cubit_example/cubits/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.off) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Internet OFF'),
                backgroundColor: Colors.red,
              ));
            } else if (state == InternetState.on) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Internet ON'),
                backgroundColor: Colors.green,
              ));
            }
          },
          builder: (context, state) {
            if (state == InternetState.off) {
              return const Text('Internet OFF');
            } else if (state == InternetState.on) {
              return const Text('Internet ON');
            } else {
              return const Text('Loading...');
            }
          },
        ),
      ),
    );
  }
}
