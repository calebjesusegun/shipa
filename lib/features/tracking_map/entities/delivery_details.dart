import 'package:shipa/features/tracking_map/entities/courier.dart';
import 'package:shipa/features/tracking_map/entities/delivery_timeline_step.dart';

class DeliveryDetails {
  final Courier courier;
  final String orderId;
  final List<DeliveryTimelineStep> timeline;

  const DeliveryDetails({
    required this.courier,
    required this.orderId,
    required this.timeline,
  });

  DeliveryDetails.testData()
    : orderId = 'ORD-682834513',
      courier = const Courier(
        id: 'c_123',
        name: 'Presley Williams',
        profileImageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
        phoneNumber: '+1234567890',
      ),
      timeline = const [
        DeliveryTimelineStep(
          title: 'On Delivery',
          subtitle: 'Courier is delivering the package',
          eta: '25 minutes destination',
          time: '10:47 AM',
          date: '18 Jan, 2026',
          isCompleted: true,
        ),
        DeliveryTimelineStep(
          title: 'Delivered',
          subtitle: 'Akoko, Ibadan',
          time: null,
          date: null,
          isCompleted: false,
        ),
      ];
}
