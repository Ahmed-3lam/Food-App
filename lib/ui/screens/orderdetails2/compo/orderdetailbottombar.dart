import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/detailsmyorder3/detailsmyorder3.dart';

class OrdeDetailBottomBar extends StatelessWidget {
  const OrdeDetailBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: kpaddinghor17,
        child: Row(
          children: [
            Expanded(
              child: MasterButton(
                name: "Submit - \$150",
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 500),
                          pageBuilder: (context, Animation<double> _ami1,
                                  Animation<double> _anim2) =>
                              SlideTransition(
                                position: Tween<Offset>(
                                        begin: const Offset(0, .5),
                                        end: const Offset(0, 0))
                                    .animate(CurvedAnimation(
                                        parent: _ami1,
                                        curve: Curves.decelerate)),
                                child: const Detailsmyorder3(
                                  totalitemcount: 1,
                                ),
                              ),
                          opaque: false,
                          barrierDismissible: true,
                          barrierColor: Colors.black54));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
