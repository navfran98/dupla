import 'package:beamer/beamer.dart';
import 'package:dupla/presentation/design_system/tokens/colors.dart';
import 'package:dupla/presentation/design_system/tokens/fonts.dart';
import 'package:dupla/presentation/screens/chat_screen.dart';
import 'package:dupla/presentation/screens/dupla_screen.dart';
import 'package:dupla/presentation/screens/feed_screen.dart';
import 'package:dupla/presentation/screens/like_screen.dart';
import 'package:dupla/presentation/screens/profile_screen.dart';
import 'package:dupla/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const route = "/home";
  static const routeName = "home";

  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late int _currentIndex;
  List<Widget> screens = [
    const ProfileScreen(),
    const DuplaScreen(),
    const FeedScreen(),
    const LikeScreen(),
    const ChatScreen(),
  ];

  @override
  void initState() {
    super.initState();
    final location =
        ref.read(mainBeamerDelegateProvider).configuration.location;
    _currentIndex = getCurrentIndex(location);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final location =
        ref.read(mainBeamerDelegateProvider).configuration.location;
    _currentIndex = getCurrentIndex(location);
  }

  int getCurrentIndex(String location) {
    switch (location) {
      case '/home/profile':
        return 0;
      case '/home/duplas':
        return 1;
      case '/home/feed':
        return 2;
      case '/home/likes':
        return 3;
      case '/home/chats':
        return 4;
      default:
        return 0;
    }
  }

  void _onItemTapped(GlobalKey<BeamerState> key, int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        key.currentState!.routerDelegate.beamToNamed('/home/profile');
        break;
      case 1:
        key.currentState!.routerDelegate.beamToNamed('/home/duplas');
        break;
      case 2:
        key.currentState!.routerDelegate.beamToNamed('/home/feed');
        break;
      case 3:
        key.currentState!.routerDelegate.beamToNamed('/home/likes');
        break;
      case 4:
        key.currentState!.routerDelegate.beamToNamed('/home/chats');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var beamerKey = GlobalKey<BeamerState>();
    return Scaffold(
      body: Beamer(
        key: beamerKey,
        routerDelegate: BeamerDelegate(
          transitionDelegate: const NoAnimationTransitionDelegate(),
          locationBuilder: RoutesLocationBuilder(routes: {
            '/home/profile': (context, state, data) => const ProfileScreen(),
            '/home/duplas': (context, state, data) => const DuplaScreen(),
            '/home/feed': (context, state, data) => const FeedScreen(),
            '/home/likes': (context, state, data) => const LikeScreen(),
            '/home/chats': (context, state, data) => const ChatScreen(),
          }).call,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CustomColors.primary1,
        selectedItemColor: CustomColors.primary4,
        unselectedItemColor: CustomColors.primary3,
        selectedIconTheme: const IconThemeData(size: 26),
        showUnselectedLabels: true,
        unselectedLabelStyle: const CustomFont.body02(CustomColors.primary3),
        selectedLabelStyle: const CustomFont.body03(CustomColors.primary4),
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
          BottomNavigationBarItem(label: 'Duplas', icon: Icon(Icons.group)),
          BottomNavigationBarItem(
              label: 'Feed', icon: ImageIcon(AssetImage('images/clover.png'))),
          BottomNavigationBarItem(label: 'Likes', icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(label: 'Chats', icon: Icon(Icons.chat)),
        ],
        onTap: (index) => _onItemTapped(beamerKey, index),
      ),
    );
  }
}
