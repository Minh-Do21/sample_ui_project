import 'package:bloc/bloc.dart';
import 'package:mor_flutter_project/data/barrel_data.dart';
import 'package:mor_flutter_project/services/repository/conmon_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<InitDataEvent>(_onInitDataEvent);
  }

  final commonRepository = CommonRepository();

  Future<void> _onInitDataEvent(
      InitDataEvent event, Emitter<HomeState> emit) async {}
}
