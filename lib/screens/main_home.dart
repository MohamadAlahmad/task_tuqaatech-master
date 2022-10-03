import 'package:flutter/material.dart';
import 'package:task_tuqaatech/screens/fragments/buttomBar/home.dart';
import 'package:task_tuqaatech/screens/fragments/buttomBar/message.dart';
import 'package:task_tuqaatech/screens/fragments/buttomBar/search.dart';
import 'package:task_tuqaatech/screens/mainScreen/messages.dart';
import 'package:task_tuqaatech/screens/mainScreen/search.dart';
import 'package:task_tuqaatech/screens/mainScreen/welcome.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int selectedIndex = 0;
  String title = 'Home';

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
      switch (index) {
        case 0:
          title = 'Home';
          break;
        case 1:
          title = 'Find a partner';
          break;
        case 2:
          title = 'Messages';
          break;
        default:
      }
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(title),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
              ),
            )),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: const [
            WelcomeHomeScreen(),
            SearchHomeScreen(),
            MessageHomeScreen()
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              homeComponent(
                  isActive: selectedIndex == 0,
                  onTab: () {
                    onButtonPressed(0);
                  }),
              searchComponent(
                  isActive: selectedIndex == 1,
                  onTab: () {
                    onButtonPressed(1);
                  }),
              messageComponent(
                  isActive: selectedIndex == 2,
                  onTab: () {
                    onButtonPressed(2);
                  })
            ],
          ),
        ));
  }
}

List<Widget> _listOfWidget = <Widget>[
  Container(
    alignment: Alignment.center,
    child: const Icon(
      Icons.event,
      size: 56,
      color: Colors.brown,
    ),
  ),
  Container(
    alignment: Alignment.center,
    child: const Icon(
      Icons.search,
      size: 56,
      color: Colors.brown,
    ),
  ),
  Container(
    alignment: Alignment.center,
    child: const Icon(
      Icons.bolt,
      size: 56,
      color: Colors.brown,
    ),
  ),
];
