part of 'shipment_bloc.dart';

enum ShipmentStatus { initial, success, error }

extension ShipmentStatusChange on ShipmentStatus {
  bool get isInitial => this == ShipmentStatus.initial;
  bool get isSuccess => this == ShipmentStatus.success;
  bool get isError => this == ShipmentStatus.error;
}

final class ShipmentState extends Equatable {
  const ShipmentState({
    this.status = ShipmentStatus.initial,
    this.shipments = const <Shipment>[],
    this.hasReachedMax = false,
    this.selectedId = '',
  });

  final ShipmentStatus status;
  final List<Shipment> shipments;
  final bool hasReachedMax;
  final String selectedId;

  ShipmentState copyWith({
    ShipmentStatus? status,
    List<Shipment>? shipments,
    bool? hasReachedMax,
    String? selectedId,
  }) =>
      ShipmentState(
        status: status ?? this.status,
        shipments: shipments ?? this.shipments,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        selectedId: selectedId ?? this.selectedId,
      );

  @override
  List<Object> get props => [status, shipments, hasReachedMax, selectedId];
}
