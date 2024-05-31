
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'browser_event.dart';
part 'browser_state.dart';

class BrowserBloc extends Bloc<BrowserEvent, BrowserState> {
  BrowserBloc() : super(BrowserState());
}
