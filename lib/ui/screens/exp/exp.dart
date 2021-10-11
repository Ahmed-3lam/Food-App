import 'package:frontend/Helpers/mlib.dart';

class TheAnnimation extends StatefulWidget {
  const TheAnnimation({Key? key}) : super(key: key);

  @override
  _TheAnnimationState createState() => _TheAnnimationState();
}

class _TheAnnimationState extends State<TheAnnimation>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();

    animation = Tween(begin: 0, end: 1).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SizedBox(
          width: 100,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Anim(isFocused: controller.value < .33),
              const SizedBox(
                width: 4,
              ),
              Anim(isFocused: controller.value < .66),
              const SizedBox(
                width: 4,
              ),
              Anim(isFocused: controller.value < .80),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Anim extends StatelessWidget {
  const Anim({Key? key, required this.isFocused}) : super(key: key);
  final bool isFocused;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isFocused ? 12 : 10,
      width: isFocused ? 12 : 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isFocused ? kcred : kcgrey3,
      ),
      duration: const Duration(milliseconds: 150),
    );
  }
}
