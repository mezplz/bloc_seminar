import 'package:bloc/bloc.dart';

import '../model/cart.dart';
import '../service/cart_list_service.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.repo}) : super(CartLoading()) {
    on<LoadCart>(_onLoad);
    on<CartItemAdded>(_onItemAdded);
    on<CartItemRemoved>(_onItemRemoved);
  }

  final CartRepository repo;

  void _onLoad(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final items = await repo.loadCartItems();
      emit(CartLoaded(cart: Cart(list: [...items])));
    } catch (_) {
      emit(CartError());
    }
  }

  void _onItemAdded(CartItemAdded event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        repo.addItemToCart(event.item);
        emit(CartLoaded(cart: Cart(list: [...state.cart.list, event.item])));
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onItemRemoved(CartItemRemoved event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        repo.removeItemFromCart(event.item);
        emit(
          CartLoaded(
            cart: Cart(
              list: [...state.cart.list]..remove(event.item),
            ),
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }
}
