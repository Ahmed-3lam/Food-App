import 'package:frontend/Helpers/mlib.dart';

class RadioTile extends StatefulWidget {
  const RadioTile({
    Key? key,
    required this.name,
    required this.homeadress,
    required this.num,
    this.isselected = false,
    this.ontap,
  }) : super(key: key);
  final String name, homeadress, num;
  final bool? isselected;
  final VoidCallback? ontap;
  @override
  State<RadioTile> createState() => _RadioTileState();
}

class _RadioTileState extends State<RadioTile> {
  bool isselected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 17),
        child: AnimatedContainer(
          duration: const Duration(microseconds: 500),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color:
                  widget.isselected! ? kcred.withOpacity(.1).withBlue(1) : null,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: !widget.isselected! ? const Color(0xffECECEC) : kcred,
                  width: 2)),
          height: 100,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 2),
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      decoration: widget.isselected!
                          ? const BoxDecoration(
                              shape: BoxShape.circle,
                              color: kcred,
                            )
                          : BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xff979797),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 9,
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: ktsAnsemi,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.num,
                        style: ktsAnsemi.copyWith(color: kctxtcolor),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.homeadress,
                        style: ktsAnsemi.copyWith(color: kctxtcolor),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
