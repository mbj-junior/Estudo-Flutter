import 'package:bloc_tutorial/pages/bloc/home_event.dart';
import 'package:bloc_tutorial/pages/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(HomeLoadingState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    throw UnimplementedError();
  }
}
