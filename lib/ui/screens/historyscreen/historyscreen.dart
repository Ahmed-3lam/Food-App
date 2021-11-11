import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/repositary/historymodelrepo.dart';
import 'HistoryScreenComponents/historytile.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kpadding,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: histrory.length,
                  itemBuilder: (BuildContext context, int index) {
                    return HistoryTile(
                      image: histrory[index].image,
                      name: histrory[index].name,
                      date: histrory[index].date,
                      isCancelled: histrory[index].isCancelled,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
