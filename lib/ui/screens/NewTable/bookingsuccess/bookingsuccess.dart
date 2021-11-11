import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/hometabbar/hometabar.dart';

class BookingSuccess extends StatelessWidget {
  const BookingSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcwhite,
      bottomNavigationBar: Container(
        color: kcwhite,
        padding: const EdgeInsets.only(
          bottom: 40,
          left: 24,
          right: 24,
        ),
        child: MasterButton(
            name: 'OKAY',
            onTap: () {
              RouteX.sliderRighToLeft(context, const MainHome());
            }),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: 85,
            width: 99,
            child: Image.asset('asset/images/tablebooking/dinner_table.png'),
          ),
          ksv24,
          Text(
            'Reservation Confirmed',
            style: nestedBaseStyle.copyWith(fontSize: 22),
          ),
          ksv20,
          Text(
            'Party of 2',
            style: nestedBaseStyle.copyWith(fontSize: 16),
          ),
          Text(
            'Wed, 29 Apr, 09:00 AM',
            style: nestedBaseStyle.copyWith(fontSize: 16),
          ),
          ksv30,
          ksv30,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: IconWithName(
                    image: 'asset/images/tablebooking/icon_2.png',
                    name: 'Call'),
              ),
              ksh30,
              IconWithName(
                  image: 'asset/images/tablebooking/icon_1.png',
                  name: 'Directions'),
            ],
          )
        ],
      ),
    );
  }
}

class IconWithName extends StatelessWidget {
  const IconWithName({Key? key, required this.image, required this.name})
      : super(key: key);
  final String image, name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 31,
          width: 31,
          child: Image.asset(image),
        ),
        ksv6,
        Text(
          name,
          style: nestedBaseStyle.copyWith(fontSize: 18),
        )
      ],
    );
  }
}
