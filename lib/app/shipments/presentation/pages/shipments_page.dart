import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../domain/repositories/shipments_repository.dart';
import '../../domain/usecases/get_shipments_usecase.dart';
import '../bloc/shipment_bloc.dart';
import 'shipments_view.dart';

class ShipmentsPage extends StatelessWidget {
  const ShipmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShipmentBloc(
        getShipmentsUseCase: GetShipmentsUseCase(
          shipmentsRepository: service.get<ShipmentsRepository>(),
        ),
      )..add(GetShipmentsEvent()),
      child: const ShipmentsView(),
    );
  }
}
