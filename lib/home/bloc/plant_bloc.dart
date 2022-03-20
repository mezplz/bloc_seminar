import 'package:bloc/bloc.dart';
import 'package:shopping_bloc/home/service/plant_list_service.dart';

import 'plant_event.dart';
import 'plant_state.dart';

class PlantBloc extends Bloc<PlantEvent, PlantState> {
  PlantBloc({required this.repo}) : super(PlantLoading()) {
    on<LoadPlantList>(_onLoad);
  }

  final PlantListRepository repo;

  void _onLoad(LoadPlantList event, Emitter<PlantState> emit) async {
    emit(PlantLoading());
    try {
      final plant = await repo.loadPlant();
      emit(PlantLoaded(plant));
    } catch (_) {
      emit(PlantError());
    }
  }
}
