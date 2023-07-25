abstract class OrderRepository {
  Future getOrders();
  Future getOrderDetails(String orderId);
}
