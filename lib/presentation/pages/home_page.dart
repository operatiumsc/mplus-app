import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldStateKey =
        GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldStateKey,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                scaffoldStateKey.currentState?.openDrawer();
              },
              icon: Icon(Icons.menu_rounded)),
          title: const Text('Kids\'App')),
      body: Row(
        children: [
          _NavRail(),
          Container(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: _HomeDrawer(),
    );
  }
}

class _NavRail extends StatelessWidget {
  const _NavRail({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return NavigationRail(
      destinations: [
        NavigationRailDestination(
          icon: Icon(Icons.book_outlined),
          selectedIcon: Icon(
            Icons.book_outlined,
            color: Theme.of(context).primaryColor,
          ),
          label: Text('Quotations'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.book),
          selectedIcon: Icon(
            Icons.book,
            color: Theme.of(context).primaryColor,
          ),
          label: Text('Purchase Orders'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.receipt),
          selectedIcon: Icon(
            Icons.receipt,
            color: Theme.of(context).primaryColor,
          ),
          label: Text('Purchase Orders'),
        ),
      ],
      labelType: NavigationRailLabelType.all,
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {},
    );
  }
}

class _HomeDrawer extends HookWidget {
  const _HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.book_outlined),
            title: Text('Quotations'),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Purchase Orders'),
          ),
          ListTile(
            leading: Icon(Icons.receipt),
            title: Text('Invoices'),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment'),
          ),
          ListTile(
            leading: Icon(Icons.local_shipping),
            title: Text('Shipment'),
          ),
          ListTile(
            leading: Icon(Icons.backpack),
            title: Text('Backorders'),
          ),
          ListTile(
            leading: Icon(Icons.person_2),
            title: Text('Customers'),
          )
        ],
      ),
    );
  }
}
