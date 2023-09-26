import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/shipment_bloc.dart';
import '../widgets/shipment_item.dart';
import '../widgets/shipments_menu.dart';

class ShipmentsView extends StatefulWidget {
  const ShipmentsView({super.key});

  @override
  State<ShipmentsView> createState() => _ShipmentsViewState();
}

class _ShipmentsViewState extends State<ShipmentsView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF003B73),
            Color(0xFF0074B7),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: BlocBuilder<ShipmentBloc, ShipmentState>(
        builder: (context, state) {
          switch (state.status) {
            case ShipmentStatus.error:
              return const Text('err');

            case ShipmentStatus.initial:
              return const Center(
                child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );

            case ShipmentStatus.success:
              if (state.shipments.isEmpty) {
                return const Text('No shipments found');
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ShipmentMenu(),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async => context
                          .read<ShipmentBloc>()
                          .add(RefreshShipmentEvent()),
                      child: Scrollbar(
                        child: ListView.separated(
                          controller: _scrollController,
                          itemBuilder: (context, index) {
                            return index >= state.shipments.length
                                ? const Text('Loading...')
                                : ShipmentItem(
                                    shipment: state.shipments[index]);
                          },
                          itemCount: state.hasReachedMax
                              ? state.shipments.length
                              : state.shipments.length + 1,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                          padding: const EdgeInsets.all(16.0),
                        ),
                      ),
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<ShipmentBloc>().add(GetShipmentsEvent());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
