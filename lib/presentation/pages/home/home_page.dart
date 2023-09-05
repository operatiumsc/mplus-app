import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mplus_app/presentation/pages/signin/signin_page.dart';
import 'package:mplus_app/presentation/widgets/text_hover_builder.dart';
import 'package:provider/provider.dart';

import 'Home_page_change_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: implement provider
    return const _HomeView();
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView({super.key});

  @override
  State<_HomeView> createState() => __HomeViewState();
}

class __HomeViewState extends State<_HomeView> {
  final GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey<ScaffoldState>();

  final pageController = PageController(initialPage: 0, keepPage: true);

  late HomePageChangeNotifier homeController;

  @override
  void initState() {
    homeController =
        Provider.of<HomePageChangeNotifier>(context, listen: false);
    homeController.currentSelectedMenu = homeController.salesMenu;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldStateKey,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: Row(
          children: [
            PopupMenuButton(
              icon: const Icon(Icons.apps),
              itemBuilder: (context) => [
                const PopupMenuItem(
                    child: ListTile(
                  title: Text('Sales'),
                )),
                const PopupMenuItem(
                    child: ListTile(
                  title: Text('Customers'),
                )),
                const PopupMenuItem(
                    child: ListTile(
                  title: Text('Inventory'),
                )),
                const PopupMenuItem(
                    child: ListTile(
                  title: Text('Shipments'),
                ))
              ],
            ),
            Text(
              context.watch<HomePageChangeNotifier>().selectedMenu,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              width: 8,
            ),
            Row(
              children: homeController.currentSelectedMenu
                  .map((e) => Visibility(
                        visible: e.isVisible,
                        child: TextHoverBuilder(
                          builder: (isHovered) => TextButton(
                              onPressed: () {
                                pageController.jumpToPage(homeController
                                    .currentSelectedMenu
                                    .indexOf(e));
                              },
                              child: Text(
                                e.menu!,
                                style: isHovered
                                    ? hoverTextStyle
                                    : normalTextStyle,
                              )),
                        ),
                      ))
                  .toList(),
            ),
            const Spacer(),
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.settings),
                          label: const Text('Settings'),
                        ),
                      ),
                      PopupMenuItem(
                        child: TextButton.icon(
                          onPressed: () {
                            context
                                .read<HomePageChangeNotifier>()
                                .performSignOut();

                            Navigator.of(context).pushAndRemoveUntil(
                                CupertinoPageRoute(
                                    builder: (context) => const LoginPage()),
                                (route) => false);
                          },
                          icon: const Icon(Icons.logout),
                          label: const Text('Sign out'),
                        ),
                      ),
                    ],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: const CircleAvatar()),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
        leadingWidth: double.infinity,
        toolbarHeight: 64,
        foregroundColor: Colors.white,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) => homeController.onSelectedMenu(index),
        children: homeController.currentSelectedMenu
            .where((e) => e.isVisible)
            .map((e) => e.child ?? Container())
            .toList(),
      ),
    );
  }

  static const normalTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.normal);
  static const hoverTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
}
