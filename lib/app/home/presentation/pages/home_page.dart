import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mplus_app/utils/constants/colors.dart';
import 'package:mplus_app/app/auth/presentation/login/pages/signin_page.dart';
import 'package:provider/provider.dart';

import '../providers/Home_page_change_notifier.dart';

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

  late HomePageChangeNotifier notifier;

  @override
  void initState() {
    notifier = Provider.of<HomePageChangeNotifier>(context, listen: false);
    notifier.currentSelectedMenu = notifier.salesMenu;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldStateKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.navyBlue,
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
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Row(
              children: notifier.currentSelectedMenu
                  .map(
                    (e) => Visibility(
                      visible: e.isVisible,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: Colors.transparent,
                        ),
                        child: ChoiceChip(
                          selected: notifier.currentPageIndex ==
                              notifier.currentSelectedMenu.indexOf(e),
                          onSelected: (value) {
                            pageController.jumpToPage(
                                notifier.currentSelectedMenu.indexOf(e));
                          },
                          selectedColor: notifier.currentPageIndex ==
                                  notifier.currentSelectedMenu.indexOf(e)
                              ? AppColors.royalBlue
                              : Colors.transparent,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          label: Text(
                            e.menu!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
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
        onPageChanged: (index) => notifier.onSelectedMenu(index),
        children: notifier.currentSelectedMenu
            .where((e) => e.isVisible)
            .map((e) => e.child ?? Container())
            .toList(),
      ),
    );
  }
}
