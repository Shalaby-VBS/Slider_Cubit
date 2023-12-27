import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(const SliderInitial(value: 0.0));

  void onChanged(double value) {
    emit(SliderOnChanged(value: value));
  }
}
