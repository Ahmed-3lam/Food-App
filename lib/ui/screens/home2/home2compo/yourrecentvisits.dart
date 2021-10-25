import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/repositary/dishes.dart';
import 'package:frontend/ui/screens/details/details.dart';
import 'package:frontend/ui/widgets/infromationwidget.dart';

class YourRecentVisits extends StatelessWidget {
  const YourRecentVisits({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: kpaddinghor20,
          child: Row(
            children: [
              const FoodText.ktsAnreg(
                "Your recent visits",
                fonsize: 22,
              ),
              const Spacer(),
              SizedBox(
                width: 90,
                height: 30,
                child: FlatButton(
                    padding: EdgeInsets.zero,
                    color: kcred.withOpacity(.25),
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      child: const FoodText.ktsAnreg(
                        "Show All",
                        color: kcred,
                      ),
                    )),
              )
            ],
          ),
        ),
        ksv12,
        SizedBox(
          height: 200,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: dishes.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  RouteX.sliderRighToLeft(
                      context,
                      Details(
                        image: dishes[index].image,
                      ));
                },
                child: Padding(
                  padding: index == dishes.length
                      ? const EdgeInsets.only(left: 0, right: 20)
                      : index == 0
                          ? const EdgeInsets.only(left: 10)
                          : const EdgeInsets.only(left: 0),
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 150,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 150,
                          child: Row(
                            children: [
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          color: kcwhite,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: const Offset(0, 4),
                                                color: kcTransparent
                                                    .withOpacity(.25),
                                                blurRadius: 13,
                                                spreadRadius: 0),
                                          ]),
                                      height: 123,
                                      width: 123,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          dishes[index].image,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FoodText.ktsAnreg(dishes[index].name),
                                  FoodText(
                                    dishes[index].resturantName,
                                    color: kctxtcolor,
                                    fonsize: 12,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  IConedText(
                                      data: MyFlutterApp.star,
                                      name:
                                          "${dishes[index].starCount} (${dishes[index].viewCount})",
                                      color: kcGolden)
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
