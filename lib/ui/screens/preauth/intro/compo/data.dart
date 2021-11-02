class IntroModel {
  IntroModel({
    required this.data,
    required this.image,
  });
  final String data, image;
}

List<IntroModel> intros = <IntroModel>[
  IntroModel(
      data: 'Find your favourite\nrestaurants near you.',
      image: 'asset/images/illustration/1.png'),
  IntroModel(
      data: 'Get food deliver\nin minutes.',
      image: 'asset/images/illustration/2.png'),
  IntroModel(
    data: 'Welcome to\nThe Food App.',
    image: 'asset/images/illustration/3.png',
  ),
];
