part of 'temple_cubit.dart';

sealed class TempleState extends Equatable {
  const TempleState();

  @override
  List<Object> get props => [];
}

final class TempleInitial extends TempleState {}

final class TempleLoadingState extends TempleState {}

final class TempleErrorState extends TempleState {
  final String message;
  const TempleErrorState({required this.message});
}

final class TempleGetedTemples extends TempleState {
  final List<Temple> temples;

  const TempleGetedTemples({required this.temples});
}
