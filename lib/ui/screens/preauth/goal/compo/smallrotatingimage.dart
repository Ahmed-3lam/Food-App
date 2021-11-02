import 'package:frontend/Helpers/mlib.dart';

class SmallRotatingImage extends StatefulWidget {
  const SmallRotatingImage(
      {Key? key, required this.image, required this.isLeft})
      : super(key: key);

  final String image;
  final bool isLeft;
  @override
  _SmallRotatingImageState createState() => _SmallRotatingImageState();
}

class _SmallRotatingImageState extends State<SmallRotatingImage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..addListener(() {});
    _animation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.decelerate));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _controller.forward();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform.translate(
        offset: widget.isLeft
            ? Offset(-size.width / 2 * _animation.value, 0)
            : Offset(size.width / 2 * _animation.value, 0),
        child: Transform(
          origin: const Offset(73 * .8, 73 * .8),
          transform: Matrix4.identity()..rotateZ(_animation.value * 2 * 3.14),
          child: Transform.scale(
            scale: .8,
            child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(6),
                height: 146,
                width: 146,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(73),
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: kcTransparent.withOpacity(.13),
                          offset: const Offset(2, 4),
                          blurRadius: 10)
                    ],
                    border: Border.all(color: kcred),
                    color: kcwhite,
                    shape: BoxShape.circle)),
          ),
        ),
      ),
    );
  }
}
