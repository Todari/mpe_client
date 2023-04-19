import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpe_test/main.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'initial text');
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: CupertinoTextField(
        controller: _textController,
      ),
    );
  }
}

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dataList = [
      {
        "sender": "파란입술",
        "lastContent": "야",
        "sendTime": "33",
      },
      {
        "sender": "노란입술",
        "lastContent": "야",
        "sendTime": "33",
      },
      {
        "sender": "붉은노을",
        "lastContent": "야",
        "sendTime": "33",
      },
      {
        "sender": "초록나무",
        "lastContent": "야",
        "sendTime": "33",
      },
    ];

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "Message",
          textAlign: TextAlign.left,
        ),
      ),
      child: CupertinoPageScaffold(
        child: Column(
          children: [
            SearchBar(),
            Expanded(
              child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = dataList[index % dataList.length];
                  print(data);
                  String sender = data["sender"];
                  String lastContent = data["lastContent"];
                  String sendTime = data["sendTime"];
                  print(sender);
                  print(lastContent);
                  print(sendTime);

                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Center(
                          child: Text(
                            sender,
                          ),
                        ),
                        const SizedBox(
                          width: double.infinity,
                          height: 80,
                          // : BoxFit.cover ,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:mpe_test/main.dart';
// import 'Styles.dart';
// import 'model/app_state_model.dart';
// import 'package:mpe_test/model/message.dart';
// import 'model/message_repo.dart';
// import 'model/message_row_item.dart';
// import 'package:provider/provider.dart';

// class SearchBar extends StatelessWidget {
//   const SearchBar({
//     required this.controller,
//     required this.focusNode,
//   });

//   final TextEditingController controller;
//   final FocusNode focusNode;

//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: const BoxDecoration(color: mpePrimaryColor),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 4,
//           vertical: 8,
//         ),
//         child: Row(children: [
//           const Icon(
//             CupertinoIcons.search,
//             color: Styles.searchIconColor,
//           ),
//           Expanded(
//             child: CupertinoTextField(
//               controller: controller,
//               focusNode: focusNode,
//               style: Styles.searchText,
//               cursorColor: Styles.searchCursorColor,
//             ),
//           ),
//           GestureDetector(
//             onTap: controller.clear,
//             child: const Icon(
//               CupertinoIcons.clear_thick_circled,
//               color: Styles.searchIconColor,
//             ),
//           )
//         ]),
//       ),
//     );
//   }
// }

// class ChatWidget extends StatefulWidget {
//   const ChatWidget({super.key});
//   @override
//   _ChatWidgetState createState() {
//     return _ChatWidgetState();
//   }
// }

// class _ChatWidgetState extends State<ChatWidget> {
//   late TextEditingController _controller;
//   late FocusNode _focusNode;
//   String _terms = '';

//   @override
//   void initState() {
//     super.initState();
//     _controller = TextEditingController()..addListener(_onTextChanged);
//     _focusNode = FocusNode();
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     _controller.dispose();
//     super.dispose();
//   }

//   void _onTextChanged() {
//     setState(() {
//       _terms = _controller.text;
//     });
//   }

//   Widget _buildSearchBox() {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: SearchBar(
//         controller: _controller,
//         focusNode: _focusNode,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final model = Provider.of<AppStateModel>(context);
//     final results = model.search(_terms);

//     return DecoratedBox(
//       decoration: const BoxDecoration(
//         color: Styles.scaffoldBackground,
//       ),
//       child: SafeArea(
//         child: Column(
//           children: [
//             _buildSearchBox(),
//             Expanded(
//               child: ListView.builder(
//                 itemBuilder: (context, index) {
//                   MessageRowItem(
//                     index: index,
//                     message: results[index],
//                     lastItem: index == results.length - 1,
//                   );
//                 },
//                 itemCount: results.length,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
