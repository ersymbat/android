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
  if(iteemPrice)

  double delivery = deliveryFee ?? 500.0;

  double finalTotal = itemPrice - discount + delivery;

  print('Order ID: $orderId');
  print('Item price: ${itemPrice.toString()} ₸');
  print('Discount: ${discount.toString()} ₸');
  print('Delivery fee: ${delivery.toString()} ₸');
  print('Final total: ${finalTotal.toString()} ₸');

  return finalTotal;
}

void main() {
  double total = processOrder(
    orderId: 'ORD-001',
    itemPrice: 5000.0,
    promoCode: 'SAVE10',
    deliveryFee: 300.0,
  );

  print('Returned total: $total ₸');
}