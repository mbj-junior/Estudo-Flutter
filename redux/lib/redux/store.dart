class Store<State> {
  final State _state;
  Store(State initalState) : _state = initalState;

  State get state => _state;
}
