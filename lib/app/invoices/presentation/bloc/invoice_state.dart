part of 'invoice_bloc.dart';

enum InvoiceStatus { initial, success, error }

extension InvoiceStatusChange on InvoiceStatus {
  bool get isInitial => this == InvoiceStatus.initial;
  bool get isSuccess => this == InvoiceStatus.success;
  bool get isError => this == InvoiceStatus.error;
}

class InvoiceState extends Equatable {
  const InvoiceState({
    this.status = InvoiceStatus.initial,
    this.invoices = const <Invoice>[],
    this.hasReachedMax = false,
  });

  final InvoiceStatus status;
  final List<Invoice> invoices;
  final bool hasReachedMax;

  InvoiceState copyWith(
          {InvoiceStatus? status,
          List<Invoice>? invoices,
          bool? hasReachedMax}) =>
      InvoiceState(
        status: status ?? this.status,
        invoices: invoices ?? this.invoices,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      );

  @override
  List<Object> get props => [status, invoices, hasReachedMax];
}
