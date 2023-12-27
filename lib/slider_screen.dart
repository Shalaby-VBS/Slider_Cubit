import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'slider_cubit/slider_cubit.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Slider'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<SliderCubit, SliderState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Text(
                        state is SliderInitial ? 'Slider Initial: ${state.value.toInt()}' : state is SliderOnChanged ? 'Slider onChanged: ${state.value.toInt()}' : 'Slider Initial: 0',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Slider.adaptive(
                        min: 0.0,
                        max: 200.0,
                        activeColor: Colors.deepPurple,
                        inactiveColor: Colors.deepPurple.shade100,
                        thumbColor: Colors.lightBlueAccent,
                        value: state is SliderInitial ? state.value : state is SliderOnChanged ? state.value : 0.0,
                        onChanged: (value) {
                          debugPrint('Slider onChanged: ${value.toInt()}');
                          context.read<SliderCubit>().onChanged(value);
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        )
    );
  }
}
