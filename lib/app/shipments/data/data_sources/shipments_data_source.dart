import 'package:mplus_app/app/invoices/presentation/config.dart';
import 'package:mplus_app/app/shipments/data/dto/shipment_dto.dart';
import 'package:mplus_app/utils/services/rest.dart';

abstract class ShipmentsDataSource {
  Future<List<ShipmentDTO>> getShipments({int? page});
}

class ShipmentsDataSourceImpl implements ShipmentsDataSource {
  final _client = Rest().client;

  @override
  Future<List<ShipmentDTO>> getShipments({int? page}) async {
    final response = await _client.get('/shipments', queryParameters: {
      'page': page,
      'perPage': PageConfig.pageSize,
    });

    List json = response.data;

    return json.map((e) => ShipmentDTO.fromJson(e)).toList();
  }
}
