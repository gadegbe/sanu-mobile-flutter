import 'package:equatable/equatable.dart';

enum BlocStateType {
  idle,
  loading,
  loaded,
  empty,
  failure,
  ;

  bool get isIdle => this == BlocStateType.idle;
  bool get isLoading => this == BlocStateType.loading;
  bool get isLoaded => this == BlocStateType.loaded;
  bool get isFailure => this == BlocStateType.failure;
}

typedef SimpleBlocState<T> = BlocState<T, void, void, void, dynamic>;

class BlocState<T, Tidle, Tloading, Tempty, Tfailure> extends Equatable {
  const BlocState({
    required this.type,
    this.loadingData,
    this.loadedData,
    this.idleData,
    this.emptyData,
    this.failureData,
  });

  factory BlocState.idle([Tidle? data]) => BlocState(
        type: BlocStateType.idle,
        idleData: data,
      );

  factory BlocState.loading([Tloading? data]) => BlocState(
        type: BlocStateType.loading,
        loadingData: data,
      );

  factory BlocState.loaded({required T data}) => BlocState(
        type: BlocStateType.loaded,
        loadedData: data,
      );

  factory BlocState.empty({Tempty? data}) => BlocState(
        type: BlocStateType.empty,
        emptyData: data,
      );

  factory BlocState.failure([Tfailure? data]) => BlocState(
        type: BlocStateType.failure,
        failureData: data,
      );

  final BlocStateType type;
  final T? loadedData;
  final Tidle? idleData;
  final Tloading? loadingData;
  final Tempty? emptyData;
  final Tfailure? failureData;

  bool get isIdle => type == BlocStateType.idle;

  bool get isLoading => type == BlocStateType.loading;

  bool get isLoaded => type == BlocStateType.loaded;

  bool get isEmpty => type == BlocStateType.empty;

  bool get isFailure => type == BlocStateType.failure;

  bool get isNotIdle => !isIdle;

  bool get isNotLoading => !isLoading;

  bool get isNotLoaded => !isLoaded;

  bool get isNotEmpty => !isEmpty;

  bool get isNotFailure => !isFailure;

  TResult when<TResult extends Object?>({
    required TResult Function(Tidle?) idle,
    required TResult Function(Tloading?) loading,
    required TResult Function(T) loaded,
    required TResult Function(Tfailure?) failure,
    required TResult Function(Tempty?) empty,
  }) {
    if (isIdle) {
      return idle(idleData);
    }
    if (isLoading) {
      return loading(loadingData);
    }
    if (isLoaded) {
      return loaded(loadedData as T);
    }
    if (isEmpty) {
      return empty(emptyData);
    }
    if (isFailure) {
      return failure(failureData);
    }
    throw Exception('Invalid map state');
  }

  TResult maybeWhen<TResult extends Object?>({
    required TResult Function() orElse,
    TResult Function(Tidle?)? idle,
    TResult Function(Tloading?)? loading,
    TResult Function(T)? loaded,
    TResult Function(Tempty?)? empty,
    TResult Function(Tfailure?)? failure,
  }) {
    if (isIdle && idle != null) {
      return idle(idleData);
    }
    if (isLoading && loading != null) {
      return loading(loadingData);
    }
    if (isLoaded && loaded != null) {
      return loaded(loadedData as T);
    }
    if (isEmpty && empty != null) {
      return empty(emptyData);
    }
    if (isFailure && failure != null) {
      return failure(failureData);
    }
    return orElse();
  }

  bool typeEquals(BlocState<T, Tidle, Tloading, Tempty, Tfailure> other) {
    if (isIdle && other.isIdle) return true;
    if (isLoading && other.isLoading) return true;
    if (isLoaded && other.isLoaded) return true;
    if (isEmpty && other.isEmpty) return true;
    if (isFailure && other.isFailure) return true;
    return false;
  }

  @override
  List<Object?> get props => [
        type,
        loadedData,
        loadingData,
        idleData,
        emptyData,
        failureData,
      ];

  BlocState<T, Tidle, Tloading, Tempty, Tfailure> copyWith({
    BlocStateType? type,
    T? loadedData,
    Tidle? idleData,
    Tloading? loadingData,
    Tempty? emptyData,
    Tfailure? failureData,
  }) {
    return BlocState(
      type: type ?? this.type,
      loadedData: loadedData ?? this.loadedData,
      idleData: idleData ?? this.idleData,
      loadingData: loadingData ?? this.loadingData,
      emptyData: emptyData ?? this.emptyData,
      failureData: failureData ?? this.failureData,
    );
  }
}
