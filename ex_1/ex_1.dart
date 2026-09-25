double processOrder({
  required String orderId,
  required double itemPrice,
  String? promoCode,
  double? deliveryFee,
}) {
  double discount = 0.0;

  if (promoCode == 'SAVE10') {
    discount = itemPrice * 0.10;
  }

  double delivery = deliveryFee ?? 500.0;

  double finalTotal = itemPrice - discount + delivery;

  print('Order ID: $orderId');
  print('Item price: ${itemPrice.toStringAsFixed(2)} ₸');
  print('Discount: ${discount.toStringAsFixed(2)} ₸');
  print('Delivery fee: ${delivery.toStringAsFixed(2)} ₸');
  print('Final total: ${finalTotal.toStringAsFixed(2)} ₸');

  return finalTotal;
}

void main() {
  double total = processOrder(
    orderId: 'ORD-001',
    itemPrice: 5000.0,
    promoCode: 'SAVE10',
  );

  print('Returned total: $total ₸');
}