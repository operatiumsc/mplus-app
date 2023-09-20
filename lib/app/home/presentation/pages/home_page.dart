import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/home_change_notifier.dart';
import 'sales_module.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeChangeNotifier>(
      builder: (_, notifier, __) {
        if (notifier.currentModule.name == 'Sales') {
          return const SalesModule();
        } else {
          return const Center(
            child: Text('404 Not found.'),
          );
        }
      },
    );
  }
}
