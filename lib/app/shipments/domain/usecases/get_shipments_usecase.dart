import 'package:mplus_app/app/shipments/domain/entities/shipment.dart';
import 'package:mplus_app/app/shipments/domain/repositories/shipments_repository.dart';

class GetShipmentsUseCase {
  GetShipmentsUseCase({required ShipmentsRepository shipmentsRepository})
      : _shipmentsRepository = shipmentsRepository;

  final ShipmentsRepository _shipmentsRepository;

  Future<List<Shipment>> call({int? page}) {
    return _shipmentsRepository.getShipments(page: page);
  }
}
