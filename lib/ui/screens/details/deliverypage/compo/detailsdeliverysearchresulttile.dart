import 'package:flutter/material.dart';
import 'package:frontend/ui/constants/colors.dart';
import 'package:frontend/ui/constants/paddings.dart';
import 'package:frontend/ui/constants/textstyles.dart';

typedef Indexer = void Function(int i);

class DetailsSearchResultTile extends StatefulWidget {
  const DetailsSearchResultTile({
    Key? key,
    required this.count,
    required this.image,
    required this.name,
    required this.decrement,
    required this.increment,
  }) : super(key: key);

  final int count;
  final String image, name;

  final Indexer decrement;
  final Indexer increment;

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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FoodText.ktsAnsemi(
                  widget.name,
                  fonsize: 16,
                ),
                const FoodText.ktsAnsemi(
                  "Always a picnic favourite",
                  fonsize: 12,
                  color: kctxtcolor,
                ),
                FoodText.ktsAnsemi(
                  i == 0 ? "\$150" : "\$${150 * i}",
                  color: kcred,
                )
              ],
            ),
            const Spacer(),
            MaterialButton(
              splashColor: kcred.withOpacity(.3),
              padding: EdgeInsets.zero,
              height: 24,
              minWidth: 24,
              onPressed: () {
                if (i > 0) {
                  i--;

                  widget.decrement(i);
                  setState(() {});
                }
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: i > 0
                    ? const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kcred,
                      )
                    : BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: kctxtcolor, width: 1.5)),
                child: Center(
                  child: Icon(
                    Icons.remove,
                    color: i > 0 ? kcwhite : kctxtcolor,
                  ),
                ),
              ),
            ),
            FoodText(
              "$i",
              fonsize: 16,
            ),
            MaterialButton(
              splashColor: kcred.withOpacity(.3),
              padding: EdgeInsets.zero,
              height: 24,
              minWidth: 24,
              onPressed: () {
                i++;

                widget.increment(i);
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
