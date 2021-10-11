import 'package:flutter/cupertino.dart';
import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/calander/calander.dart';

import 'choosetimeslotbutton.dart';

class BookTable extends StatefulWidget {
  const BookTable({Key? key}) : super(key: key);

  @override
  _BookTableState createState() => _BookTableState();
}

class _BookTableState extends State<BookTable> {
  int i = 0;
  int slotTIme = 0;

  // _buildName() {
  //   return Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
  //     CircleAvatar(
  //       backgroundColor: kcOrange,
  //       radius: 18,
  //     ),
  //     ksh16,
  //     FoodText.ktsAnreg(
  //       "On The Border Of Cantina",
  //       fonsize: 14.5,
  //       color: kcOrange,
  //     )
  //   ]);
  // }

  _buildMembers() {
    return Row(children: [
      const Icon(Icons.accessibility),
      ksh12,
      FoodText(i == 0 ? "1" : "${i + 1}", fonsize: 30),
      ksh12,
      const FoodText.ktsAnsemi(
        "Adult",
        fonsize: 18,
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
            setState(() {});
          }
        },
        child: Container(
          height: 30,
          width: 30,
          decoration: i > 0
              ? const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        kcGradient1,
                        kcGradient2,
                      ]))
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
      SizedBox(
        width: 30,
        child: MaterialButton(
          padding: EdgeInsets.zero,
          height: 24,
          minWidth: 30,
          onPressed: () {
            i++;
            setState(() {});
          },
          child: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        kcGradient1,
                        kcGradient2,
                      ])),
              child: const Icon(
                Icons.add,
                color: kcwhite,
              )),
        ),
      )
    ]);
  }

  _buildBooking() {
    return Row(
      children: [
        const FoodText.ktsAnsemi(
          "Sat,22 Sep",
          fonsize: 22,
        ),
        const Spacer(),
        SizedBox(
          child: MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const CalanderScreen());
            },
            child: const FoodText.ktsAnsemi(
              "Pick Date",
              color: kcred,
            ),
          ),
        )
      ],
    );
  }

  _buildAppbar() {
    return AppBar(
      backgroundColor: kcwhite,
      elevation: 0,
      leading: SizedBox(
        height: 30,
        child: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            MyFlutterApp.arrowback,
            color: kcblack,
          ),
        ),
      ),
      centerTitle: true,
      title: const FoodText(
        "Book Table",
        fonsize: 19.5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: SizedBox(
        child: Padding(
          padding: kpaddinghor20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Image.asset("asset/images/illustration/group_51.png",
                      scale: 3)),
              const Spacer(),
              const FoodText("HOW MANY PERSON?"),
              ksv12,
              _buildMembers(),
              ksv12,
              const FoodText("CHOOSE TIME SLOT"),
              ksv20,
              SizedBox(
                height: 32,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) => GestureDetector(
                    onTap: () {
                      slotTIme = i;
                      setState(() {});
                    },
                    child: ChooseTImeSlot(
                        time: "6:30 AM", isSelected: slotTIme == i),
                  ),
                ),
              ),
              ksv20,
              const FoodText("CHOOSE RESERVATION DATE"),
              ksv24,
              _buildBooking(),
              ksv30,
              Row(
                children: [
                  const Spacer(),
                  SizedBox(
                      width: 200,
                      height: 40,
                      child: MasterButton(name: "Continue", onTap: () {})),
                  const Spacer(),
                ],
              ),
              ksv20
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmTable extends StatefulWidget {
  const ConfirmTable({Key? key}) : super(key: key);

  @override
  _ConfirmTableState createState() => _ConfirmTableState();
}

class _ConfirmTableState extends State<ConfirmTable> {
  int i = 0;
  int slotTIme = 0;

  // _buildName() {
  //   return Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
  //     CircleAvatar(
  //       backgroundColor: kcOrange,
  //       radius: 18,
  //     ),
  //     ksh16,
  //     FoodText.ktsAnreg(
  //       "On The Border Of Cantina",
  //       fonsize: 14.5,
  //       color: kcOrange,
  //     )
  //   ]);
  // }

  _buildMembers() {
    return Row(children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FoodText("HOW MANY PERSON?"),
            ksv6,
            Row(
              children: const [
                Icon(Icons.accessibility),
                ksh12,
                FoodText("6", fonsize: 30),
                ksh12,
                FoodText.ktsAnsemi(
                  "Adult",
                  fonsize: 18,
                ),
              ],
            )
          ],
        ),
      ),
      ksh18,
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FoodText("TIME SLOT"),
            ksv6,
            Row(
              children: const [
                FoodText("6:30", fonsize: 30),
                ksh12,
                FoodText.ktsAnsemi(
                  "AM",
                  fonsize: 18,
                ),
              ],
            )
          ],
        ),
      ),
    ]);
  }

  _buildBooking() {
    return const FoodText.ktsAnsemi(
      "Sat,22 Sep",
      fonsize: 22,
    );
  }

  _buildAppbar() {
    return AppBar(
      backgroundColor: kcwhite,
      elevation: 0,
      leading: SizedBox(
        height: 30,
        child: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            MyFlutterApp.arrowback,
            color: kcblack,
          ),
        ),
      ),
      centerTitle: true,
      title: const FoodText(
        "Book Table",
        fonsize: 19.5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: SizedBox(
        child: Padding(
          padding: kpaddinghor20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Image.asset("asset/images/illustration/group_51.png",
                      scale: 3)),
              const Spacer(),
              ksv12,
              _buildMembers(),
              ksv20,
              const FoodText(
                "RESERVATION DATE",
                color: kcblack,
              ),
              ksv18,
              _buildBooking(),
              ksv30,
              ksv20,
              Row(
                children: [
                  const Spacer(),
                  SizedBox(
                      width: 200,
                      height: 40,
                      child: MasterButton(name: "Done", onTap: () {})),
                  const Spacer(),
                ],
              ),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const FoodText(
                        "Cancel",
                        color: kcblack,
                      )),
                  const Spacer(),
                ],
              ),
              ksv20
            ],
          ),
        ),
      ),
    );
  }
}
