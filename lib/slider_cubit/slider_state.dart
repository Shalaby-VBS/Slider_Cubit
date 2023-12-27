part of 'slider_cubit.dart';

class SliderState {
  const SliderState();
}

class SliderInitial extends SliderState {
  final double value;
  const SliderInitial({required this.value});
}

class SliderOnChanged extends SliderState {
  final double value;
  const SliderOnChanged({required this.value});
}