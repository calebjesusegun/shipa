class DeliveryTimelineStep {
  final String title;
  final String subtitle;
  final String eta;
  final String? time;
  final String? date;
  final bool isCompleted;
  final bool isActive;

  const DeliveryTimelineStep({
    required this.title,
    required this.subtitle,
    this.eta = '',
    this.time,
    this.date,
    this.isCompleted = false,
    this.isActive = false,
  });
}
