import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/helpers/event_transformer.dart';
import '../../../../utils/constants/page_config.dart';
import '../../domain/entities/shipment.dart';
import '../../domain/usecases/get_shipments_usecase.dart';

part 'shipment_event.dart';
part 'shipment_state.dart';

class ShipmentBloc extends Bloc<ShipmentEvent, ShipmentState> {
  ShipmentBloc({required GetShipmentsUseCase getShipmentsUseCase})
      : _getShipmentsUseCase = getShipmentsUseCase,
        super(const ShipmentState()) {
    on<GetShipmentsEvent>(
      _onGetShipments,
      transformer: throttle(const Duration(milliseconds: 100)),
    );
    on<RefreshShipmentEvent>(_onRefreshShipments);
  }

  final GetShipmentsUseCase _getShipmentsUseCase;

  Future<void> _onGetShipments(
      ShipmentEvent event, Emitter<ShipmentState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status.isInitial) {
        final shipments = await _getShipmentsUseCase.call();
        return emit(
          state.copyWith(
            status: ShipmentStatus.success,
            shipments: shipments,
            hasReachedMax: false,
          ),
        );
      }

      if (!state.status.isSuccess) return;

      final pageIndex =
          (state.shipments.length / PageConfig.defaultPageSize).ceil();
      final shipments = await _getShipmentsUseCase.call(page: pageIndex);

      shipments.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: ShipmentStatus.success,
                shipments: List.of(shipments)..addAll(shipments),
                hasReachedMax: false,
              ),
            );

      debugPrint('Shipments have already reached max.');
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);

      emit(state.copyWith(status: ShipmentStatus.error));
    }
  }

  Future<void> _onRefreshShipments(
      ShipmentEvent event, Emitter<ShipmentState> emit) async {
    debugPrint('Perform refresh indicator');
    try {
      final shipments = await _getShipmentsUseCase.call();

      emit(
        state.copyWith(
          status: ShipmentStatus.success,
          shipments: shipments,
          hasReachedMax: false,
        ),
      );
    } catch (err, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      emit(state.copyWith(status: ShipmentStatus.error));
    }
  }
}
