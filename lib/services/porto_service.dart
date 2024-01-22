import 'package:news_app/model/porto_model.dart';

List<PortoModel> listPorto() {
  return [
    PortoModel(
      name: "Porto 1",
      image: "assets/porto1.png",
    ),
    PortoModel(
      name: "Porto 2",
      image: "assets/porto2.png",
    ),
    PortoModel(
      name: "Porto 3",
      image: "assets/porto3.png",
    ),
  ];
}

List<PortoModel> listTols() {
  return [
    PortoModel(
      name: "Flutter",
      image: "assets/flutter.svg",
    ),
    PortoModel(
      name: "Figma",
      image: "assets/figma.svg",
    ),
    PortoModel(
      name: "Laravel",
      image: "assets/laravel.svg",
    ),
    PortoModel(
      name: "Python",
      image: "assets/python.svg",
    ),
  ];
}
