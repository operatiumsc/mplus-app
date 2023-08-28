import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mplus_app/domain/entities/main_menu_entity.dart';
import 'package:mplus_app/presentation/pages/invoices_page.dart';
import 'package:mplus_app/presentation/pages/purchase_orders_page.dart';
import 'package:mplus_app/presentation/pages/quotes_page.dart';

class HomeController extends ChangeNotifier {
  String selectedMenu = 'Sales';
  List<MainMenuEntity> salesMenu = [
    MainMenuEntity(
      menu: 'Quotes',
      onTapped: () {},
      child: const QuotesPage(),
      isVisible: true,
    ),
    MainMenuEntity(
      menu: 'Purchase Orders',
      child: const PurchaseOrdersPage(),
      onTapped: () {},
    ),
    MainMenuEntity(
      menu: 'Invoices',
      child: const InvoicesPage(),
      onTapped: () {},
    ),
  ];

  List<MainMenuEntity> currentSelectedMenu = [];

  int currentPageIndex = 0;

  onSelectedMenu(int index) {
    currentPageIndex = index;
    notifyListeners();
  }
}
