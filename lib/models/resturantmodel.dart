class ResturantModel {
  const ResturantModel({
    required this.name,
    required this.image,
    required this.adress,
    required this.startRating,
    required this.discount,
    required this.time,
    required this.distance,
    required this.revieCount,
  });
  final String name, image, adress;
  final double startRating, discount, time, distance;
  final int revieCount;
}
