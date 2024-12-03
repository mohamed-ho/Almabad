import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/features/home/domain/usecases/get_temples_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'temple_state.dart';

class TempleCubit extends Cubit<TempleState> {
  final GetTemplesUsecase getTemplesUsecase;
  TempleCubit({required this.getTemplesUsecase}) : super(TempleInitial());

  Future<void> getTemples() async {
    emit(TempleLoadingState());
    final result = await getTemplesUsecase();
    result.fold((l) => emit(TempleErrorState(message: l.message)),
        (r) => emit(TempleGetedTemples(temples: r)));
  }
}
