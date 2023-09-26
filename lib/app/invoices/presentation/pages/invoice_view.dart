import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mplus_app/app/invoices/presentation/bloc/invoice_bloc.dart';
import 'package:mplus_app/app/invoices/presentation/widgets/invoice_item.dart';
import 'package:mplus_app/app/invoices/presentation/widgets/invoice_not_found.dart';

import '../../../../utils/constants/colors.dart';

class InvoiceView extends StatefulWidget {
  const InvoiceView({super.key});

  @override
  State<InvoiceView> createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        gradient: LinearGradient(
          colors: [
            AppColors.navyBlue,
            AppColors.royalBlue,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: BlocBuilder<InvoiceBloc, InvoiceState>(builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async =>
              context.read<InvoiceBloc>().add(GetInvoiceEvent()),
          child: Scrollbar(
            child: ListView.separated(
              controller: _scrollController,
              itemBuilder: (context, index) {
                if (state.invoices.isEmpty) {
                  return const InvoiceNotFound();
                }

                return InvoiceItem(
                  invoice: state.invoices[index],
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemCount: state.hasReachedMax
                  ? state.invoices.length
                  : state.invoices.length + 1,
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<InvoiceBloc>().add(GetInvoiceEvent());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
