import 'package:flutter/material.dart';

import '../../../auth/domain/usecases/sign_out_usecase.dart';
import '../../domain/entities/app_module.dart';
import '../pages/sales_module.dart';

class HomeChangeNotifier extends ChangeNotifier {
  final SignOutUseCase _signOutUseCase;

  HomeChangeNotifier({required SignOutUseCase signOutUseCase})
      : _signOutUseCase = signOutUseCase;

  final List<AppModule> appModules = [
    AppModule(
      name: 'Sales',
      child: const SalesModule(),
      subModules: [
        SubModule(name: 'Quotes'),
        SubModule(name: 'Purchase Orders'),
        SubModule(name: 'Invoices'),
        SubModule(name: 'Shipments'),
      ],
    ),
  ];

  int _currentAppModuleIndex = 0;
  int _currentSubMuduleIndex = 0;

  AppModule get currentModule => appModules[_currentAppModuleIndex];
  SubModule get currentSubModule =>
      appModules[_currentAppModuleIndex].subModules[_currentSubMuduleIndex];
  int get currentSubModuleIndex => _currentSubMuduleIndex;

  void selectedAppModule(int index) {
    _currentAppModuleIndex = index;

    //Reset the current sub-module
    _currentSubMuduleIndex = 0;
    notifyListeners();
  }

  void selectedSubModule(
      {required PageController pageController, required int index}) {
    _currentSubMuduleIndex = index;

    pageController.jumpToPage(index);

    notifyListeners();
  }

  Future performSignOut() async {
    await _signOutUseCase.call();
  }
}
