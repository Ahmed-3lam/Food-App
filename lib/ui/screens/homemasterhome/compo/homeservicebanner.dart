import 'package:frontend/Helpers/mlib.dart';

class HomeServiceBanner extends StatelessWidget {
  const HomeServiceBanner({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
            offset: const Offset(0, 5),
            color: kcTransparent.withOpacity(.25),
            blurRadius: 12,
            spreadRadius: 0),
      ]),
      height: 165,
      width: MediaQuery.of(context).size.width - 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
