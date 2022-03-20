import 'dart:ffi';

class Plant {
  final String name;
  final String des;
  final int price;
  final String img;

  Plant(
      {required this.name,
      required this.des,
      required this.price,
      required this.img});
}

final plants = [
  Plant(
      name: 'Spider Plant',
      des: 'Shade-loving',
      price: 10,
      img: 'assets/images/spiderplant.png'),
  Plant(
      name: 'Song of India',
      des: 'Sun-loving',
      price: 15,
      img: 'assets/images/songofindia.png'),
  Plant(
      name: 'Pink Anthurium',
      des: 'Shade-loving',
      price: 25,
      img: 'assets/images/pinkanthurium.png'),
  Plant(
      name: 'Black Love Anthurium',
      des: 'Shade-loving',
      price: 35,
      img: 'assets/images/blackloveanthurium.png'),
  Plant(
      name: 'Grey Star Calarthea',
      des: 'Sun-loving',
      price: 20,
      img: 'assets/images/greystarcalarthea.png'),
  Plant(
      name: 'Banana Plant',
      des: 'Sun-loving',
      price: 15,
      img: 'assets/images/bananaplant.png'),
      Plant(
      name: 'Devil\'s Ivy',
      des: 'Shade-loving',
      price: 15,
      img: 'assets/images/devilivy.png'),
      Plant(
      name: 'Palm',
      des: 'Shade-loving',
      price: 15,
      img: 'assets/images/palm.png'),
      Plant(
      name: 'ZZ Plant',
      des: 'Sun-loving',
      price: 15,
      img: 'assets/images/zzplant.png'),
];
