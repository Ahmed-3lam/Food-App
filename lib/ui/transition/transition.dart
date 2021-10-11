import 'package:frontend/Helpers/mlib.dart';

class Transition extends StatefulWidget {
  const Transition({Key? key}) : super(key: key);

  @override
  State<Transition> createState() => _TransitionState();
}

class _TransitionState extends State<Transition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _animation = Tween(begin: 0, end: 1).animate(_controller);
  }

  void pusher(BuildContext context) {
    Navigator.push(
        context,
        PageRouteBuilder(
            // reverseTransitionDuration: const Duration(microseconds: 1),
            transitionDuration: const Duration(microseconds: 1),
            pageBuilder: (context, _anim, _anim2) =>
                FadeTransition(opacity: _anim, child: const Transitin())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: kpadding,
          child: Column(
            children: [
              const Center(child: FoodText("Humanbeing")),
              const Spacer(),
              Container(
                height: 200,
                width: 200,
                color: kcpurpel,
              ),
              const Spacer(),
              MasterButton(
                  name: "Transition",
                  onTap: () {
                    pusher(context);
                  }),
              ksv30
            ],
          ),
        ),
      ),
    ));
  }
}

class Transitin extends StatelessWidget {
  const Transitin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        child: Padding(
          padding: kpadding,
          child: Column(
            children: [
              const Center(child: FoodText("Humming")),
              const Spacer(),
              MasterButton(
                  name: "Second",
                  onTap: () {
                    Navigator.pop(context);
                  }),
              ksv30
            ],
          ),
        ),
      ),
    ));
  }
}
