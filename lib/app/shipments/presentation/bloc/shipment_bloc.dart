import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mplus_app/app/invoices/presentation/config.dart';
import 'package:mplus_app/app/shipments/domain/usecases/get_shipments_usecase.dart';

import '../../domain/entities/shipment.dart';

part 'shipment_event.dart';
part 'shipment_state.dart';

class ShipmentBloc extends Bloc<ShipmentEvent, ShipmentState> {
  ShipmentBloc({required GetShipmentsUseCase getShipmentsUseCase})
      : _getShipmentsUseCase = getShipmentsUseCase,
        super(const ShipmentState()) {
    on<GetShipmentsEvent>(_onGetShipments);
  }

  final GetShipmentsUseCase _getShipmentsUseCase;

  Future<void> _onGetShipments(
      GetShipmentsEvent event, Emitter<ShipmentState> emit) async {
    if (state.hasReachedMax) return;

    emit(state.copyWith(status: ShipmentStatus.loading));

    try {
      if (state.status.isInitial) {
        final shipments = await _getShipmentsUseCase.call();

        return emit(state.copyWith(
          status: ShipmentStatus.success,
          shipments: shipments,
          hasReachedMax: false,
        ));
      }

      final pageIndex = state.shipments.length % PageConfig.pageSize;

      final shipments = await _getShipmentsUseCase.call(page: pageIndex);

      if (shipments.isEmpty) {
        return emit(state.copyWith(
          status: ShipmentStatus.success,
          shipments: shipments,
          hasReachedMax: true,
        ));
      } else {
        return emit(state.copyWith(
          status: ShipmentStatus.success,
          shipments: shipments..addAll(shipments),
          hasReachedMax: false,
        ));
      }
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);

      emit(state.copyWith(status: ShipmentStatus.error));
    }
  }
}
