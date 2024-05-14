part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final FormzStatus statusLoading;
  final List<GroupModel>? groups;
  final String? errorMessage;

  const DashboardState({
    this.statusLoading = FormzStatus.pure,
    this.groups,
    this.errorMessage,
  });

  DashboardState copyWith({
    FormzStatus? statusLoading,
    List<GroupModel>? groups,
    String? errorMessage,
  }) {
    return DashboardState(
      statusLoading: statusLoading ?? this.statusLoading,
      groups: groups ?? this.groups,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        statusLoading,
        groups,
        errorMessage,
      ];
}
