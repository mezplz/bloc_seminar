import '../../home/model/plant.dart';

class Cart {
  final List<Plant> list;

  Cart({
    required this.list,
  });

  int get totalPrice {
    return list.fold(0, (total, current) => total + current.price);
  }
}
