import 'package:flutter/cupertino.dart';
import 'package:mpe_test/model/app_state_model.dart';
import 'package:provider/provider.dart';
import 'homeWidget.dart';
import 'chatWidget.dart';
import 'notificationWidget.dart';
import 'profileWidget.dart';

void main() => runApp(const Mpe());

const Color mpePrimaryColor = Color.fromARGB(255, 144, 0, 255);

class Mpe extends StatelessWidget {
  const Mpe({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: MpeStatefulWidget(),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider(
  //             create: (BuildContext context) =>
  //                 Provider.of<AppStateModel>(context)),
  //       ],
  //       child: const CupertinoApp(
  //         home: MpeStatefulWidget(),
  //       ));
  // }
}

List<Widget> data = [
  const HomeWidget(),
  const ChatWidget(),
  const NotificationWidget(),
  const ProfileWidget(),
];

class MpeStatefulWidget extends StatefulWidget {
  const MpeStatefulWidget({super.key});

  @override
  State<MpeStatefulWidget> createState() => _MpeStatefulWidgetState();
}

class _MpeStatefulWidgetState extends State<MpeStatefulWidget> {
  int _selectedIndex = 0;
  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bell),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_crop_circle),
              label: 'Profile',
            ),
          ],
          activeColor: mpePrimaryColor,
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (context) {
              return CupertinoPageScaffold(
                child: data[index],
              );
            },
          );
        },
      ),
    );
  }
}
// }






