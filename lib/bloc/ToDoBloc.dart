import 'package:bloc_app/models/todos.dart';
import 'package:bloc_app/repoistory/TodoRepo.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

abstract class GenericState extends Equatable {
  GenericState([List<dynamic> props = const []]) : super();
}

abstract class GenericEvent extends Equatable {
  GenericEvent([List props = const []]) : super();
}

class FetchToDoList extends GenericEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => "FetchToDoList";
}

class GenericStateEmpty extends GenericState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "GenericStateEmpty";
}

class GenericStateLoading extends GenericState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "GenericStateLoading";
}

class GenericStateError extends GenericState {
  final dynamic _error;

  dynamic get getError => this._error;

  GenericStateError(this._error);

  @override
  List<Object> get props => [_error];

  @override
  String toString() => "GenericStateError";
}

class GenericStateSuccess extends GenericState {
  final List<Todo> _toDoList;

  List<Todo> get getToDoList => this._toDoList;

  GenericStateSuccess(this._toDoList);

  @override
  List<Object> get props => [_toDoList];

  @override
  String toString() => "GenericStateSuccess";
}

class ToDoBloc extends Bloc<GenericEvent, GenericState> {
  final TodoRepo _todoRepo;

  ToDoBloc(this._todoRepo);

  @override
  GenericState get initialState => GenericStateEmpty();

  @override
  void onTransition(Transition<GenericEvent, GenericState> transition) {
    print(transition);
    super.onTransition(transition);
  }
  @override
  Stream<GenericState> mapEventToState(GenericEvent event) async* {
    if (event is FetchToDoList) {
      yield GenericStateLoading();
      try {
        List<Todo> toDoList = await _todoRepo.getTodo();
        if (toDoList.length == 0) {
          yield GenericStateEmpty();
        }
        yield GenericStateSuccess(toDoList);
      } catch (err) {
        yield GenericStateError(err);
      }
    }
  }
}
