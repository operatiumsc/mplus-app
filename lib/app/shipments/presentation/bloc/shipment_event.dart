part of 'shipment_bloc.dart';

sealed class ShipmentEvent extends Equatable {
  const ShipmentEvent();

  @override
  List<Object> get props => [];
}

final class GetShipmentsEvent extends ShipmentEvent {}

final class SelectedShipment extends ShipmentEvent {
  const SelectedShipment({required this.selectedId});

  final int selectedId;

  @override
  List<Object> get props => [selectedId];
}
