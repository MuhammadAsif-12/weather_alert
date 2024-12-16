abstract class FutureUseCase<Type, Params>{
  Future<Type> call ({Params params});
}

abstract class BasicUseCase<Type, Params>{
  Type call ({Params params});
}