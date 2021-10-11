import 'package:frontend/Helpers/mlib.dart';

class ChooseTImeSlot extends StatelessWidget {
  const ChooseTImeSlot({
    Key? key,
    required this.time,
    required this.isSelected,
  }) : super(key: key);
  final String time;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 25,
        width: 94,
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      kcGradient1,
                      kcGradient2,
                    ]))
            : BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: kcCalnder),
        child: Center(
          child: FoodText.ktsAnsemi(
            time,
            color: kcwhite,
          ),
        ));
  }
}
