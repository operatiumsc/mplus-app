
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mplus_app/app/invoices/presentation/pages/invoice_page.dart';
import 'package:mplus_app/app/home/domain/entities/main_menu.dart';
import 'package:mplus_app/core/auth/domain/usecases/sign_out_usecase.dart';
import 'package:mplus_app/app/orders/presentation/pages/purchase_orders_page.dart';
import 'package:mplus_app/app/quotes/presentation/pages/quotes_page.dart';

class HomePageChangeNotifier extends ChangeNotifier {
  final SignOutUseCase _signOutUseCase;

  HomePageChangeNotifier({required SignOutUseCase signOutUseCase})
      : _signOutUseCase = signOutUseCase;

  String selectedMenu = 'Sales';
  List<MainMenu> salesMenu = [
    MainMenu(
      menu: 'Quotes',
      onTapped: () {},
      child: const QuotesPage(),
    ),
    MainMenu(
      menu: 'Purchase Orders',
      child: const PurchaseOrdersPage(),
      onTapped: () {},
    ),
    MainMenu(
      menu: 'Invoices',
      child: const InvoicePage(),
      onTapped: () {},
    ),
  ];

  List<MainMenu> currentSelectedMenu = [];

  int currentPageIndex = 0;

  onSelectedMenu(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  Future performSignOut() async {
    await _signOutUseCase.call();
  }
}
