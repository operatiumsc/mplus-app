import '../repositories/order_repository.dart';

class GetOrdersUsecase {
  final OrderRepository orderRepository;

  GetOrdersUsecase(this.orderRepository);
}
