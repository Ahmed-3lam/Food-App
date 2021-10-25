import 'package:frontend/Helpers/mlib.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    Key? key,
    required this.tittle,
    required this.subTittle,
    required this.buttonText,
    required this.dialogThemeColor,
    required this.avatarChild,
    required this.onTap,
    this.style,
  }) : super(key: key);
  final String tittle, subTittle, buttonText;
  final Color dialogThemeColor;
  final Widget avatarChild;
  final VoidCallback onTap;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kcTransparent,
      width: double.infinity,
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25),
                padding: const EdgeInsets.only(
                    top: 35, left: 15, right: 15, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      tittle,
                      textAlign: TextAlign.center,
                      style: ktsAnreg.copyWith(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    ksv16,
                    Text(
                      subTittle,
                      style: ktsAnreg.copyWith(fontSize: 15),
                    ),
                    ksv24,
                    MasterButton(
                      height: 43,
                      name: buttonText,
                      onTap: onTap,
                      buttonColor: dialogThemeColor,
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: dialogThemeColor,
              child: avatarChild,
            ),
          )
        ],
      ),
    );
  }
}
