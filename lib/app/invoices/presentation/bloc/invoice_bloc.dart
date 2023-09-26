
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../utils/constants/page_config.dart';
import '../../domain/entities/invoice.dart';
import '../../domain/usecases/get_invoices_usecase.dart';

part 'invoice_event.dart';
part 'invoice_state.dart';

class InvoiceBloc extends Bloc<InvoiceEvent, InvoiceState> {
  InvoiceBloc({
    required GetInvoicesUseCase getInvoicesUseCase,
  })  : _getInvoicesUseCase = getInvoicesUseCase,
        super(const InvoiceState()) {
    on<GetInvoiceEvent>(_handleGetInvoiceEvent);
  }

  final GetInvoicesUseCase _getInvoicesUseCase;

  Future<void> _handleGetInvoiceEvent(
      GetInvoiceEvent event, Emitter<InvoiceState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status.isInitial) {
        final invoices = await _getInvoicesUseCase.call();
        return emit(
          state.copyWith(
            status: InvoiceStatus.success,
            invoices: invoices,
            hasReachedMax: false,
          ),
        );
      }

      if (!state.status.isSuccess) return;

      final pageIndex =
          (state.invoices.length / PageConfig.defaultPageSize).ceil();
      final invoices = await _getInvoicesUseCase.call(page: pageIndex);

      invoices.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: InvoiceStatus.success,
                invoices: List.of(invoices)..addAll(invoices),
                hasReachedMax: false,
              ),
            );

      debugPrint('Invoices: have already reached max.');
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);

      emit(state.copyWith(status: InvoiceStatus.error));
    }
  }
}
