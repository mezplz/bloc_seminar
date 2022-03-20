import 'package:equatable/equatable.dart';

abstract class PlantEvent extends Equatable {
  const PlantEvent();
}

class LoadPlantList extends PlantEvent {
  @override
  List<Object> get props => [];
}
