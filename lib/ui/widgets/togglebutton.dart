import 'package:frontend/Helpers/mlib.dart';

class MasterToggleButton extends StatefulWidget {
  const MasterToggleButton({Key? key, required this.tap, required this.name})
      : super(key: key);
  final Function tap;
  final String name;

  @override
  State<MasterToggleButton> createState() => _MasterToggleButtonState();
}

class _MasterToggleButtonState extends State<MasterToggleButton> {
  bool isselected = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MasterButton(
          height: 43,
          isBusy: isselected,
          radii: 5,
          name: widget.name,
          onTap: () {
            setState(() {
              isselected = !isselected;
              widget.tap();
            });
          }),
    );
  }
}
