import 'package:bloc/bloc.dart';
import 'package:sample_ui_project/data/barrel_data.dart';
import 'package:sample_ui_project/services/repository/conmon_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState()) {
    on<InitDataEvent>(_onInitDataEvent);
  }

  final commonRepository = CommonRepository();

  Future<void> _onInitDataEvent(
      InitDataEvent event, Emitter<DashboardState> emit) async {}
}
