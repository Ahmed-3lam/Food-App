import 'package:frontend/Helpers/mlib.dart';

class DetailsSearchResultTile extends StatefulWidget {
  const DetailsSearchResultTile({
    Key? key,
    required this.count,
    required this.onIncrase,
    required this.onDecrase,
  }) : super(key: key);

  final int count;
  final VoidCallback onIncrase;
  final VoidCallback onDecrase;

  @override
  State<DetailsSearchResultTile> createState() =>
      _DetailsSearchResultTileState();
}

class _DetailsSearchResultTileState extends State<DetailsSearchResultTile> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kpaddingver18,
      child: SizedBox(
        child: Row(
          children: [
            SizedBox(
                height: 60,
                width: 60,
                child: Image.asset("asset/images/home/smrect.png")),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                FoodText.ktsAnsemi(
                  "Fried Chicken",
                  fonsize: 16,
                ),
                FoodText.ktsAnsemi(
                  "Always a picnic favourite",
                  fonsize: 12,
                  color: kctxtcolor,
                ),
                FoodText.ktsAnsemi(
                  "\$150",
                  color: kcred,
                )
              ],
            ),
            const Spacer(),
            // MaterialButton(
            //   splashColor: kcred.withOpacity(.3),
            //   padding: EdgeInsets.zero,
            //   height: 24,
            //   minWidth: 24,
            //   onPressed: () {
            //     if (i > 0) {
            //       i--;
            //       setState(() {});
            //     }
            //   },
            //   child: Container(
            //     height: 30,
            //     width: 30,
            //     decoration: i > 0
            //         ? const BoxDecoration(
            //             shape: BoxShape.circle,
            //             color: kcred,
            //           )
            //         : BoxDecoration(
            //             shape: BoxShape.circle,
            //             border: Border.all(color: kctxtcolor, width: 1.5)),
            //     child: Center(
            //       child: Icon(
            //         Icons.remove,
            //         color: i > 0 ? kcwhite : kctxtcolor,
            //       ),
            //     ),
            //   ),
            // ),
            i == 0
                ? const SizedBox()
                : FoodText(
                    i == 0 ? "1" : "$i",
                    fonsize: 16,
                  ),
            MaterialButton(
              splashColor: kcred.withOpacity(.3),
              padding: EdgeInsets.zero,
              height: 24,
              minWidth: 24,
              onPressed: () {
                i++;
                setState(() {});
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kcred,
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: kcwhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
