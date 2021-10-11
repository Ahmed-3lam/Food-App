import 'package:frontend/Helpers/mlib.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TrackerWidget extends StatelessWidget {
  const TrackerWidget({
    Key? key,
    required this.status,
  }) : super(key: key);

  final int status;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: Stack(
        alignment: Alignment.center,
        children: [
          RotatedBox(
              quarterTurns: 1,
              child: LinearPercentIndicator(
                percent: .25 * status,
                backgroundColor: kcgrey3,
                lineHeight: 3,
                animationDuration: 2000,
                progressColor: kcred,
                animation: true,
                animateFromLastPercent: true,
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NodeOfPercent(
                nodeNumber: 0,
                selctone: status >= 0,
              ),
              NodeOfPercent(
                nodeNumber: 1,
                selctone: status >= 1,
              ),
              NodeOfPercent(
                nodeNumber: 2,
                selctone: status >= 2,
              ),
              NodeOfPercent(
                nodeNumber: 3,
                selctone: status >= 3,
              ),
              NodeOfPercent(
                nodeNumber: 4,
                selctone: status >= 4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NodeOfPercent extends StatefulWidget {
  const NodeOfPercent(
      {Key? key, required this.nodeNumber, required this.selctone})
      : super(key: key);
  final bool selctone;
  final int nodeNumber;

  @override
  State<NodeOfPercent> createState() => _NodeOfPercentState();
}

class _NodeOfPercentState extends State<NodeOfPercent> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 100,
      ),
      height: 21,
      width: 20,
      decoration: BoxDecoration(
          color: widget.selctone ? kcred : kcwhite,
          borderRadius: BorderRadius.circular(4.5),
          border: Border.all(
              color: widget.selctone ? kcred : kcdivider, width: 1.5)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Icon(
            Icons.done,
            size: 17.5,
            color: widget.selctone ? kcwhite : kcTransparent,
          ),
        ),
      ),
    );
  }
}
