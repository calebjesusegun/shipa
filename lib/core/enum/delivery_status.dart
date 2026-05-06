enum DeliveryStatus {
  delivered,
  onDelivery;

  String get label => switch (this) {
    delivered => 'Delivered',
    onDelivery => 'On Delivery',
  };
}
