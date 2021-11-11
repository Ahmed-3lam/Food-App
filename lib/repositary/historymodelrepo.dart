import 'package:frontend/models/historymodel.dart';

List<History> history = <History>[
  History(
      paidAmount: 125,
      isCancelled: false,
      name: 'S&L diner ',
      date: '23/7/2021',
      image: 'asset/images/home/fried.png'),
  History(
    paidAmount: 140,
    isCancelled: true,
    name: 'AT&T',
    date: '3/6/2021',
    image: 'asset/images/home/rectangle.png',
  ),
  History(
    paidAmount: 100,
    isCancelled: false,
    name: 'Romera',
    date: '2/5/2021',
    image: 'asset/images/home/smfried.png',
  ),
  History(
      paidAmount: 99,
      isCancelled: false,
      name: 'Etaliano',
      date: '7/2/2021',
      image: 'asset/images/home/smrect.png'),
];
