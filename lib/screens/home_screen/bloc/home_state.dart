part of 'home_bloc.dart';

class HomeState extends Equatable {
  final FormzStatus statusLoading;
  final List<GroupModel>? groups;
  final String? errorMessage;

  const HomeState({
    this.statusLoading = FormzStatus.pure,
    this.groups,
    this.errorMessage,
  });

  HomeState copyWith({
    FormzStatus? statusLoading,
    List<GroupModel>? groups,
    String? errorMessage,
  }) {
    return HomeState(
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
