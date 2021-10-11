import 'package:flutter/material.dart';

class DetailDeliveryOfferTile extends StatelessWidget {
  const DetailDeliveryOfferTile({
    Key? key,
    required this.color,
    required this.data,
    required this.offerdata,
  }) : super(key: key);
  final Color color;
  final IconData data;
  final String offerdata;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        height: 46,
        child: Row(
          children: [
            Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(9)),
                child: Center(
                  child: Icon(data, color: Colors.white),
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(child: Text(offerdata))
          ],
        ),
      ),
    );
  }
}
