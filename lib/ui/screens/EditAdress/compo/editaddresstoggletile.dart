import 'package:frontend/Helpers/mlib.dart';

class EditAdressToggleTile extends StatelessWidget {
  const EditAdressToggleTile({
    Key? key,
    required this.selctone,
    required this.tap,
    required this.name,
  }) : super(key: key);

  final bool selctone;
  final VoidCallback tap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: tap,
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 100,
            ),
            height: 21,
            width: 20,
            decoration: BoxDecoration(
                color: selctone ? kcred : null,
                borderRadius: BorderRadius.circular(4.5),
                border: Border.all(
                    color: selctone ? kcred : kcdivider, width: 1.5)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Icon(
                  Icons.done,
                  size: 17.5,
                  color: selctone ? kcwhite : kcTransparent,
                ),
              ),
            ),
          ),
        ),
        ksh12,
        FoodText(name)
      ],
    );
  }
}
