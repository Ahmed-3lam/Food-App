import 'package:frontend/Helpers/mlib.dart';

typedef Stringify = Function(String);

class TimeGrid extends StatefulWidget {
  const TimeGrid({
    Key? key,
    required this.times,
    required this.stringify,
    required this.tap,
  }) : super(key: key);

  final List<String> times;
  final Stringify stringify;
  final VoidCallback tap;

  @override
  State<TimeGrid> createState() => _TimeGridState();
}

class _TimeGridState extends State<TimeGrid> {
  int selectedtime = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 22),
          width: double.infinity,
          padding:
              const EdgeInsets.only(top: 20, left: 27, right: 24, bottom: 23),
          decoration: BoxDecoration(
            color: kcwhite,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(-1, 7),
                  blurRadius: 39,
                  color: kcTransparent.withOpacity(.13))
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Time',
                style: TextStyle(
                    fontFamily: 'Master',
                    color: kcNestedTabcolor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              ksv18,
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 2),
                itemCount: widget.times.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      selectedtime = index;
                      widget.stringify(widget.times[selectedtime]);
                      widget.tap();
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedtime == index ? kcred : kcwhite,
                        borderRadius: BorderRadius.circular(4),
                        border: selectedtime == index
                            ? Border.all(color: kcred)
                            : Border.all(color: kcgrey5),
                      ),
                      child: Center(
                        child: Text(
                          widget.times[index],
                          style: TextStyle(
                              fontFamily: 'Master',
                              color: selectedtime == index
                                  ? kcwhite
                                  : kcNestedTabcolor,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
