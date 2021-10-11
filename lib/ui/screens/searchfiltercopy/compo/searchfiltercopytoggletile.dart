import 'package:frontend/Helpers/mlib.dart';

class SearchFilterCopyToggleTile extends StatelessWidget {
  const SearchFilterCopyToggleTile({
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
    return GestureDetector(
        onTap: tap,
        child: GestureDetector(
          onTap: tap,
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 100,
            ),
            height: 40,
            decoration: BoxDecoration(
                color: selctone ? kcred : kcgrey2,
                borderRadius: BorderRadius.circular(4.5),
                border: Border.all(
                    color: selctone ? kcred : kcdivider, width: 1.5)),
            child: Center(
              child: FoodText.ktsAnreg(
                name,
                color: selctone ? kcwhite : kcblack,
              ),
            ),
          ),
        ));
  }
}