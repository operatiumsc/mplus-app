import 'package:mplus_app/app/shipments/domain/entities/shipment.dart';

abstract class ShipmentsRepository {
  Future<List<Shipment>> getShipments({int? page});
}
