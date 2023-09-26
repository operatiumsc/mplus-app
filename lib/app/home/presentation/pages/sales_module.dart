import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../injection.dart';
import '../../../../utils/constants/colors.dart';
import '../../../invoices/domain/repositories/invoice_repository.dart';
import '../../../invoices/domain/usecases/get_invoices_usecase.dart';
import '../../../invoices/presentation/pages/invoice_page.dart';
import '../../../invoices/presentation/providers/invoice_page_change_notifier.dart';
import '../../../orders/domain/repositories/purchase_orders_repository.dart';
import '../../../orders/domain/usecases/get_purchase_order_lines_usecase.dart';
import '../../../orders/domain/usecases/get_purchase_orders_usecase.dart';
import '../../../orders/presentation/pages/purchase_orders_page.dart';
import '../../../orders/presentation/providers/purchase_orders_change_notifier.dart';
import '../../../quotes/domain/repositories/quotes_repository.dart';
import '../../../quotes/domain/usecases/get_quotes_usecase.dart';
import '../../../quotes/presentation/change_notifiers/quotes_change_notifier.dart';
import '../../../quotes/presentation/pages/quotes_page.dart';

import '../../../shipments/presentation/pages/shipments_page.dart';
import '../providers/home_change_notifier.dart';
import '../widgets/all_menus_button.dart';
import '../widgets/user_avatar_button.dart';

class SalesModule extends StatelessWidget {
  const SalesModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuotesChangeNotifier(
            getQuotesUseCase: GetQuotesUseCase(
              quotesRepository: service.get<QuotesRepository>(),
            ),
          ),
        ),
        ChangeNotifierProvider<PurchaseOrdersChangeNotifier>(
          create: (_) => PurchaseOrdersChangeNotifier(
            getPurchaseOrdersUseCase: GetPurchaseOrdersUseCase(
              purchaseOrdersRepository: service.get<PurchaseOrdersRepository>(),
            ),
            getPurchaseOrderLinesUseCase: GetPurchaseOrderLinesUseCase(
              purchaseOrdersRepository: service.get<PurchaseOrdersRepository>(),
            ),
          ),
        ),
        ChangeNotifierProvider<InvoiceChangeNotifier>(
          create: (_) => InvoiceChangeNotifier(
            getInvoicesUseCase: GetInvoicesUseCase(
              invoiceRepository: service.get<InvoiceRepository>(),
            ),
          ),
        ),

        // ChangeNotifierProvider(
        //   create: (_) => ShipmentsChangeNotifier(
        //     getShipmentsUseCase: GetShipmentsUseCase(
        //       shipmentsRepository: service.get<ShipmentsRepository>(),
        //     ),
        //   ),
        // )
      ],
      builder: (_, __) => const _SalesView(),
    );
  }
}

class _SalesView extends StatelessWidget {
  const _SalesView({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(
        initialPage: context.watch<HomeChangeNotifier>().currentSubModuleIndex);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.navyBlue,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: Row(
          children: [
            const AllModulesButton(),
            Consumer<HomeChangeNotifier>(
              builder: (_, notifier, __) => Text(
                notifier.currentModule.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Row(
              children: List.generate(
                context
                    .read<HomeChangeNotifier>()
                    .currentModule
                    .subModules
                    .length,
                (index) => Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.transparent,
                  ),
                  child: Consumer<HomeChangeNotifier>(
                    builder: (_, notifier, __) => ChoiceChip(
                      selected: notifier.currentSubModuleIndex == index,
                      onSelected: (_) {
                        notifier.selectedSubModule(
                          pageController: pageController,
                          index: index,
                        );
                      },
                      selectedColor: notifier.currentSubModuleIndex == index
                          ? AppColors.royalBlue
                          : Colors.transparent,
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      label: Text(
                        notifier.currentModule.subModules[index].name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            const UserAvatarButton(),
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
        onPageChanged: (index) {
          context
              .read<HomeChangeNotifier>()
              .selectedSubModule(pageController: pageController, index: index);
          pageController.jumpToPage(index);
        },
        children: const [
          QuotesView(),
          PurchaseOrdersView(),
          InvoiceView(),
          ShipmentsPage(),
        ],
      ),
    );
  }
}
