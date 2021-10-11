import 'package:frontend/Helpers/mlib.dart';

typedef Indexer = Function(int);

class GuestNumber extends StatefulWidget {
  const GuestNumber({Key? key, required this.indexer, required this.ontap})
      : super(key: key);
  final Indexer indexer;
  final VoidCallback ontap;

  @override
  _GuestNumberState createState() => _GuestNumberState();
}

class _GuestNumberState extends State<GuestNumber> {
  int icon = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 43,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 43,
              height: 43,
              child: MaterialButton(
                onPressed: () {
                  if (icon > 0) {
                    icon--;
                    setState(() {});
                    widget.indexer(icon);
                    widget.ontap();
                  }
                },
                padding: EdgeInsets.zero,
                child: const Icon(
                  Icons.remove,
                  color: kcNestedTabcolor,
                ),
              ),
            ),
            ksh8,
            Text(
              '$icon',
              style: nestedBaseStyle,
            ),
            ksh8,
            SizedBox(
              width: 43,
              height: 43,
              child: MaterialButton(
                onPressed: () {
                  icon++;
                  setState(() {});
                  widget.indexer(icon);
                  widget.ontap();
                },
                padding: EdgeInsets.zero,
                child: const Icon(
                  Icons.add,
                  color: kcred,
                ),
              ),
            ),
          ],
        ));
  }
}
