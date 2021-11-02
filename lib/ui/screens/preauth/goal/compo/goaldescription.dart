import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/extension/sizingextension.dart';
import 'package:frontend/ui/utils/spaces.dart';
import 'package:frontend/ui/utils/textutlities.dart';

class GOALDescription extends StatelessWidget {
  const GOALDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kcTransparent,
      child: Column(children: [
        Text(
          'Welcome To\nThe Food App',
          textAlign: TextAlign.center,
          style: FontStyleUtilities.h3(
              fontColor: kcwhite, fontWeight: FWT.semiBold),
        ),
        SpaceUtils.ks16.height(),
        Text(
          'Sometimes you need treat and\nyou deserve a nice one.',
          textAlign: TextAlign.center,
          style: FontStyleUtilities.t2(
              fontColor: kcwhite, fontWeight: FWT.semiBold),
        )
      ]),
    );
  }
}
