import 'dart:async';

import 'package:shopping_bloc/home/model/plant.dart';

const _delay = Duration(milliseconds: 800);

class PlantListRepository {
  Future<List<Plant>> loadPlant() => Future.delayed(_delay, () => plants);
}
