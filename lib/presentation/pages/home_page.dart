import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mplus_app/presentation/widget/animated_backgroud.dart';

import '../widget/app_logo.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width > size.height ? buildTablet() : _BuildMobile();
  }

  Widget buildTablet() {
    return Scaffold(
      body: Row(
        children: [_NavRail(), Expanded(child: Container())],
      ),
    );
  }
}

class _BuildMobile extends HookWidget {
  const _BuildMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldStateKey =
        GlobalKey<ScaffoldState>();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        key: scaffoldStateKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: const AppLogo.full(),
        ),
        backgroundColor: Colors.transparent,
        body: AnimatedBackground(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome, '),
                SizedBox(
                  height: 120,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: 18,
                          ),
                          SizedBox(width: 6),
                          Text('ค้นหา Order'),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.withOpacity(0.8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Text(
                            'เครดิตคงเหลือ',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Expanded(child: Container()),
                          Text(
                            'XX.XX',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(width: 6),
                          Icon(
                            FontAwesomeIcons.eye,
                            size: 18,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'บริการของเรา',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(''),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Wrap(
                  spacing: 10,
                  children: [
                    Container(
                      width: 75,
                      height: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.amber.shade100),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.qrcode,
                              size: 24,
                            ),
                            SizedBox(height: 12),
                            Expanded(
                                child: Text(
                              'QR Code\nชำระเงิน',
                              textAlign: TextAlign.center,
                            )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.amber.shade100),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.commentsDollar,
                              size: 24,
                            ),
                            SizedBox(height: 12),
                            Expanded(
                              child: Text(
                                'แจ้งการชำระเงิน',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.amber.shade100,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(
                              FontAwesomeIcons.creditCard,
                              size: 24,
                            ),
                            SizedBox(height: 12),
                            FittedBox(
                                child: Text(
                              'ปรับวงเงิน',
                              textAlign: TextAlign.center,
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ข่าวสาร/โปรโมชั่น',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text('ดูเพิ่มเติม'),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Card(
                    color: Colors.white.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Borneo Review',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text('ดูเพิ่มเติม'),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Card(
                    color: Colors.white.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'A Member of Toyota Tsusho Corporation',
                  style: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Copyright © Borneo Technical (Thailand) Limited. All Right Reserved.',
                  style: GoogleFonts.inter(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.house), label: 'หน้าหลัก'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.message), label: 'ข้อความ'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.fileInvoiceDollar),
                label: 'คำสั่งซื้อ'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.bell), label: 'การแจ้งเตือน'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.bars), label: 'เมนู'),
          ],
          selectedItemColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
        ),
        drawer: _HomeDrawer(),
      ),
    );
  }
}

class _NavRail extends StatelessWidget {
  const _NavRail({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return NavigationRail(
      leading: Icon(Icons.shop),
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
