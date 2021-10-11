class History {
  History({
    required this.paidAmount,
    required this.name,
    required this.date,
    required this.image,
    required this.isCancelled,
  });
  final String name;
  final String date;
  final String image;
  final bool isCancelled;
  final int paidAmount;
}
