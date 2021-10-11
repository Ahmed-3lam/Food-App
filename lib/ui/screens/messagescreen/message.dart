import 'package:frontend/Helpers/mlib.dart';
import 'package:frontend/ui/screens/exp/exp.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late ScrollController controller;
  late TextEditingController textEditingController;
  @override
  void initState() {
    controller = ScrollController()..addListener(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: comanAppBar(context, "Message"),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Padding(
              padding: kpaddinghor17,
              child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: const [
                    MessageWrapper(
                        isnotcurrentuser: false,
                        message:
                            "Lorem ipsum dolor, Sed ullam pariatur commodi ut tempora ipsam accusamus iure quidem qui, est cupiditate dignissimos exercitationem autem dolor illo molestiae. Sunt hic nesciunt culpa impedit?"),
                    MessageWrapper(
                        isnotcurrentuser: true,
                        message:
                            "Lorem ipsum dolor, est cupiditate dignissimos exercitationem autem dolor illo molestiae. Sunt hic nesciunt culpa impedit?"),
                    MessageWrapper(
                        isnotcurrentuser: false,
                        message: "Lorem ipsum dolor impedit?"),
                    MessageWrapper(
                        isnotcurrentuser: true,
                        message:
                            "Lorem ipsum hic est cupiditate dignissimos dignissimos exercitationem autem impedit?"),
                    MessageWrapper(
                        // istyping: true,
                        isnotcurrentuser: false,
                        message: " Sunt hic impedit?"),
                    MessageWrapper(
                        istyping: true, isnotcurrentuser: true, message: ""),
                    ksv30,
                    ksv30,
                    ksv30,
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                padding: kpaddinghor20,
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: kcwhite,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff403F3F).withOpacity(.1),
                          offset: const Offset(0, -7),
                          blurRadius: 10)
                    ]),
                child: Row(children: [
                  SizedBox(
                    width: 30,
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: const Icon(Icons.add_a_photo_outlined),
                    ),
                  ),
                  ksh18,
                  Expanded(
                      child: TextField(
                    onTap: () {
                      controller.animateTo(controller.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linearToEaseOut);
                    },
                    autofocus: false,
                    decoration: const InputDecoration.collapsed(
                        hintText: "Type your question here"),
                  )),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      width: 40,
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: const FoodText.ktsAnsemi(
                          "Send",
                          color: kcred,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              bottom: 0,
            )
          ],
        ),
      ),
    );
  }
}

class MessageWrapper extends StatelessWidget {
  const MessageWrapper(
      {Key? key,
      required this.isnotcurrentuser,
      required this.message,
      this.istyping = false})
      : super(key: key);
  final bool isnotcurrentuser;
  final String message;
  final bool? istyping;

  @override
  Widget build(BuildContext context) {
    return isnotcurrentuser
        ? Container(
            margin: const EdgeInsets.only(top: 35),
            child: Row(
              children: [
                Image.asset(
                  "asset/images/home/oval.png",
                  scale: 5,
                ),
                ksh12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 11, horizontal: 16),
                        decoration: BoxDecoration(
                            color: kcgrey3,
                            borderRadius: BorderRadius.circular(13)),
                        child: istyping!
                            ? const SizedBox(
                                height: 20,
                                width: 70,
                                child: TheAnnimation(),
                              )
                            : Text(message),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.only(top: 35),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 11, horizontal: 16),
                          decoration: BoxDecoration(
                              color: kcred,
                              borderRadius: BorderRadius.circular(13)),
                          child: Text(
                            message,
                            style: const TextStyle(color: kcwhite),
                          )),
                    ],
                  ),
                ),
                ksh12,
                Image.asset(
                  "asset/images/home/oval.png",
                  scale: 5,
                ),
              ],
            ),
          );
  }
}
