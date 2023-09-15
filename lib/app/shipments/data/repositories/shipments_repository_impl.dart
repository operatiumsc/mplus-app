import 'package:mplus_app/app/shipments/data/data_sources/shipments_data_source.dart';
import 'package:mplus_app/app/shipments/data/dto/shipment_dto.dart';
import 'package:mplus_app/app/shipments/domain/entities/shipment.dart';
import 'package:mplus_app/app/shipments/domain/repositories/shipments_repository.dart';

class ShipmentsRepositoryImpl implements ShipmentsRepository {
  ShipmentsRepositoryImpl({required ShipmentsDataSource shipmentsDataSource})
      : _shipmentsDataSource = shipmentsDataSource;

  final ShipmentsDataSource _shipmentsDataSource;

  @override
  Future<List<Shipment>> getShipments({int? page}) async {
    final shipments = await _shipmentsDataSource.getShipments(page: page);
    return shipments.map((e) => e.toEntity()).toList();
  }
}
