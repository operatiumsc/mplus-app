import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mplus_app/domain/entities/main_menu.dart';
import 'package:mplus_app/app/pages/invoices_page.dart';
import 'package:mplus_app/app/pages/purchase_orders_page.dart';
import 'package:mplus_app/app/pages/quotes_page.dart';

class HomeController extends ChangeNotifier {
  String selectedMenu = 'Sales';
  List<MainMenu> salesMenu = [
    MainMenu(
      menu: 'Quotes',
      onTapped: () {},
      child: const QuotesPage(),
      isVisible: true,
    ),
    MainMenu(
      menu: 'Purchase Orders',
      child: const PurchaseOrdersPage(),
      onTapped: () {},
    ),
    MainMenu(
      menu: 'Invoices',
      child: const InvoicesPage(),
      onTapped: () {},
    ),
  ];

  List<MainMenu> currentSelectedMenu = [];

  int currentPageIndex = 0;

  onSelectedMenu(int index) {
    currentPageIndex = index;
    notifyListeners();
  }
}
