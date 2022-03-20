import 'package:shopping_bloc/home/model/plant.dart';

const _delay = Duration(milliseconds: 800);

class CartRepository {
  final list = <Plant>[];

  Future<List<Plant>> loadCartItems() => Future.delayed(_delay, () => list);

  void addItemToCart(Plant item) => list.add(item);

  void removeItemFromCart(Plant item) => list.remove(item);
}