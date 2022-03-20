
import 'package:equatable/equatable.dart';

import '../model/plant.dart';

abstract class PlantState extends Equatable {
  const PlantState();

  @override
  List<Object> get props => [];
}

class PlantLoading extends PlantState {}

class PlantLoaded extends PlantState {
  const PlantLoaded(this.plant);

  final List<Plant> plant;

  @override
  List<Object> get props => [plant];
}

class PlantError extends PlantState {}
