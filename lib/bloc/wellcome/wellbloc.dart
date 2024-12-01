import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/wellcome/wellcome_event.dart';
import 'package:flutterbloc/bloc/wellcome/wellcome_state.dart';

class Wellbloc extends Bloc<WellcomeEvent, WellcomeState> {
  Wellbloc() : super(WellcomeState()) {
    on<WellcomeEvent>(
      (event, emit) {
        emit(WellcomeState(page: state.page));
      },
    );
  }
}
