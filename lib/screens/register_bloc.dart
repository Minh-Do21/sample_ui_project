import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mor_flutter_project/screens/dashboard_screen/bloc/dashboard_bloc.dart';
import 'package:mor_flutter_project/screens/home_screen/bloc/home_bloc.dart';

extension BlocRegisterExt on BuildContext {
  HomeBloc get homeBloc => read<HomeBloc>();
  DashboardBloc get dashboardBloc => read<DashboardBloc>();
}
