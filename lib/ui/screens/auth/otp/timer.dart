import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/utils/textutlities.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  // late Timer _timer;
  // int myCount = 60;

  // startTimer() {
  //   _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     if (myCount != 0) {
  //       myCount--;
  //       setState(() {});
  //     } else {
  //       _timer.cancel();
  //     }
  //   });
  // }

  // @override
  // void initState() {
  //   startTimer();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text(
        //   'Code valid for $myCount',
        //   style: FontStyleUtilities.t2(fontWeight: FWT.bold),
        // ),
        // // SpaceUtils.ks10.height(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Have\'nt received code yet?',
              style: FontStyleUtilities.t2(
                fontWeight: FWT.semiBold,
              ),
            ),
            TextButton(
                onPressed: () {
                  // myCount = 60;
                  setState(() {});
                  // startTimer();
                },
                child: Text(
                  'RESEND OTP',
                  style: FontStyleUtilities.t2(
                      fontWeight: FWT.bold, fontColor: kcred),
                )),
          ],
        )
      ],
    );
  }
}
