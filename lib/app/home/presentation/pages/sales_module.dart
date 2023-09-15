import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mplus_app/app/home/presentation/providers/home_page_change_notifier.dart';
import 'package:mplus_app/app/home/presentation/widgets/all_menus_button.dart';
import 'package:mplus_app/app/home/presentation/widgets/user_avatar_button.dart';
import 'package:mplus_app/app/invoices/data/data_sources/invoice_data_source.dart';
import 'package:mplus_app/app/invoices/data/repositories/invoice_repository_impl.dart';
import 'package:mplus_app/app/invoices/domain/usecases/get_invoices_usecase.dart';
import 'package:mplus_app/app/invoices/presentation/pages/invoice_page.dart';
import 'package:mplus_app/app/invoices/presentation/providers/invoice_page_change_notifier.dart';
import 'package:mplus_app/app/orders/data/data_sources/purchase_orders_data_source.dart';
import 'package:mplus_app/app/orders/data/repositories/purchase_orders_repository_impl.dart';
import 'package:mplus_app/app/orders/domain/usecases/get_purchase_order_lines_usecase.dart';
import 'package:mplus_app/app/orders/domain/usecases/get_purchase_orders_usecase.dart';
import 'package:mplus_app/app/orders/presentation/pages/purchase_orders_page.dart';
import 'package:mplus_app/app/orders/presentation/providers/purchase_orders_change_notifier.dart';
import 'package:mplus_app/app/quotes/domain/repositories/quotes_repository.dart';
import 'package:mplus_app/app/quotes/domain/usecases/get_quotes_usecase.dart';
import 'package:mplus_app/app/quotes/presentation/change_notifiers/quotes_change_notifier.dart';
import 'package:mplus_app/app/quotes/presentation/pages/quotes_page.dart';
import 'package:mplus_app/app/shipments/domain/repositories/shipments_repository.dart';
import 'package:mplus_app/app/shipments/domain/usecases/get_shipments_usecase.dart';
import 'package:mplus_app/app/shipments/presentation/change_notifers/shipments_change_notifier.dart';
import 'package:mplus_app/app/shipments/presentation/pages/shipments_page.dart';
import 'package:mplus_app/injection.dart';
import 'package:mplus_app/utils/constants/colors.dart';
import 'package:provider/provider.dart';

class SalesModule extends HookWidget {
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
              purchaseOrdersRepository: PurchaseOrdersRepositoryImpl(
                purchaseOrdersDataSource: PurchaseOrdersDataSourceImpl(),
              ),
            ),
            getPurchaseOrderLinesUseCase: GetPurchaseOrderLinesUseCase(
              purchaseOrdersRepository: PurchaseOrdersRepositoryImpl(
                purchaseOrdersDataSource: PurchaseOrdersDataSourceImpl(),
              ),
            ),
          ),
        ),
        ChangeNotifierProvider<InvoiceChangeNotifier>(
          create: (_) => InvoiceChangeNotifier(
            getInvoicesUseCase: GetInvoicesUseCase(
              invoiceRepository: InvoiceRepositoryImpl(
                invoiceDataSource: InvoiceDataSourceImpl(),
              ),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ShipmentsChangeNotifier(
            getShipmentsUseCase: GetShipmentsUseCase(
              shipmentsRepository: service.get<ShipmentsRepository>(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ShipmentsChangeNotifier(
            getShipmentsUseCase: GetShipmentsUseCase(
              shipmentsRepository: service.get<ShipmentsRepository>(),
            ),
          ),
        )
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
        initialPage:
            context.watch<HomePageChangeNotifier>().currentSubModuleIndex);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.navyBlue,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: Row(
          children: [
            const AllModulesButton(),
            Consumer<HomePageChangeNotifier>(
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
                    .read<HomePageChangeNotifier>()
                    .currentModule
                    .subModules
                    .length,
                (index) => Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.transparent,
                  ),
                  child: Consumer<HomePageChangeNotifier>(
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
              .read<HomePageChangeNotifier>()
              .selectedSubModule(pageController: pageController, index: index);
          pageController.jumpToPage(index);
        },
        children: const [
          QuotesView(),
          PurchaseOrdersView(),
          InvoiceView(),
          ShipmentsView(),
        ],
      ),
    );
  }
}
