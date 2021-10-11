import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/repositary/historymodelrepo.dart';
import 'package:frontend/ui/screens/orderfailed/orderdetails.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kpadding,
          child: ListView.builder(
            itemCount: histrory.length,
            itemBuilder: (BuildContext context, int index) {
              return Historytiel(
                image: histrory[index].image,
                name: histrory[index].name,
                date: histrory[index].date,
                isCancelled: histrory[index].isCancelled,
              );
            },
          ),
        ),
      ),
    );
  }
}

class Historytiel extends StatelessWidget {
  const Historytiel({
    Key? key,
    required this.isCancelled,
    required this.name,
    required this.image,
    required this.date,
  }) : super(key: key);
  final bool isCancelled;
  final String name, image, date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RouteX.sliderRighToLeft(context, const OrderFailed());
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SizedBox(
          height: 121,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Image.asset(
                      image,
                      scale: 3,
                    ),
                  ),
                  ksh16,
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FoodText.ktsAnsemi(
                          name,
                          fonsize: 16,
                        ),
                        FoodText.ktsAnreg(
                          date,
                          fonsize: 13,
                          // color: kctxtcolor,
                        ),
                        const FoodText.ktsAnreg(
                          "\$150-Item-Cash",
                          fonsize: 13,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            isCancelled
                                ? const SizedBox()
                                : SizedBox(
                                    width: 70,
                                    child: MasterButton(
                                        radii: 10,
                                        textcolor: kcpurpel,
                                        isOutlined: true,
                                        name: "Rate",
                                        onTap: () {},
                                        height: 30,
                                        buttonColor: kcpurpel),
                                  ),
                            const SizedBox(
                              width: 4,
                            ),
                            SizedBox(
                              child: MasterButton(
                                radii: 10,
                                textcolor: kcred,
                                isOutlined: true,
                                name: "Re-Order",
                                onTap: () {},
                                height: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
              CircleAvatar(
                radius: 15,
                child: Icon(
                  isCancelled ? Icons.close : Icons.done,
                  size: 18,
                ),
                backgroundColor: isCancelled ? kcblack : kcred,
                foregroundColor: kcwhite,
              )
            ],
          ),
        ),
      ),
    );
  }
}
