import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shipa/features/location_search/presentation/location_search_screen.dart';
import 'package:shipa/features/permission/presentation/permission_screen.dart';
import 'package:shipa/features/tracking_map/presentation/tracking_map_screen.dart';
part 'app_router.g.dart';

class AppRoutes {
  static const permission = '/';
  static const locationSearch = '/search';
  static const tracking = '/tracking';
}

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoutes.permission,
    routes: [
      GoRoute(
        path: AppRoutes.permission,
        builder: (_, _) => const PermissionScreen(),
      ),
      GoRoute(
        path: AppRoutes.locationSearch,
        builder: (_, _) => const LocationSearchScreen(),
      ),
      GoRoute(
        path: AppRoutes.tracking,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return TrackingMapScreen(
            origin: args['origin'],
            destination: args['destination'],
            originName: args['originName'],
            destinationName: args['destinationName'],
          );
        },
      ),
    ],
  );
}
