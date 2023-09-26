import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../domain/repositories/invoice_repository.dart';
import '../../domain/usecases/get_invoices_usecase.dart';
import '../bloc/invoice_bloc.dart';
import 'invoice_view.dart';


class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InvoiceBloc>(
      create: (context) => InvoiceBloc(
        getInvoicesUseCase: GetInvoicesUseCase(
          invoiceRepository: service.get<InvoiceRepository>(),
        ),
      )..add(GetInvoiceEvent()),
      child: const InvoiceView(),
    );
  }
}
