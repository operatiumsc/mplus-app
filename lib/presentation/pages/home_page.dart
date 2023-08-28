import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mplus_app/presentation/pages/login_page.dart';
import 'package:mplus_app/presentation/widgets/text_hover_builder.dart';
import 'package:provider/provider.dart';

import '../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey<ScaffoldState>();

  final pageController = PageController(initialPage: 0, keepPage: true);

  late HomeController homeController;

  @override
  void initState() {
    homeController = Provider.of<HomeController>(context, listen: false);
    homeController.currentSelectedMenu = homeController.salesMenu;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldStateKey,
      appBar: AppBar(
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
              context.watch<HomeController>().selectedMenu,
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
                              icon: Icon(Icons.settings),
                              label: Text('Settings'))),
                      PopupMenuItem(
                          child: TextButton.icon(
                              onPressed: () {
                                //TODO: Call await AuthController.signOut();
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => const LoginPage()),
                                  (route) => route.isFirst,
                                );
                              },
                              icon: Icon(Icons.logout),
                              label: Text('Sign out'))),
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
