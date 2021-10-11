import 'package:frontend/Helpers/mlib.dart';

class SearchCleartile extends StatelessWidget {
  const SearchCleartile({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Row(
        children: [
          FoodText(name),
          const Spacer(),
          SizedBox(
            height: 30,
            width: 65,
            child: MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: const FoodText(
                "Clear all",
                color: kcred,
              ),
            ),
          )
        ],
      ),
    );
  }
}
