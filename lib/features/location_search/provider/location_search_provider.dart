import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/geocoding_repository.dart';
import '../model/location_data.dart';

part 'location_search_provider.g.dart';

sealed class SearchState {
  const SearchState();
}

class SearchIdle extends SearchState {
  const SearchIdle();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchSuccess extends SearchState {
  final List<LocationData> results;
  const SearchSuccess(this.results);
}

class SearchError extends SearchState {
  final String message;
  const SearchError(this.message);
}

@riverpod
class LocationSearchNotifier extends _$LocationSearchNotifier {
  final _repo = GeocodingRepository();

  @override
  SearchState build() => const SearchIdle();

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      state = const SearchIdle();
      return;
    }

    state = const SearchLoading();

    try {
      final results = await _repo.search(query);
      state = SearchSuccess(results);
    } catch (_) {
      state = const SearchError('Could not fetch results.');
    }
  }

  void clear() => state = const SearchIdle();
}

@riverpod
class SelectedLocationsNotifier extends _$SelectedLocationsNotifier {
  @override
  SelectedLocations build() => const SelectedLocations();

  void setOrigin(LocationData place) {
    state = state.copyWith(origin: place);
  }

  void setDestination(LocationData place) {
    state = state.copyWith(destination: place);
  }

  void clear() => state = const SelectedLocations();
}

class SelectedLocations {
  final LocationData? origin;
  final LocationData? destination;

  const SelectedLocations({this.origin, this.destination});

  SelectedLocations copyWith({
    LocationData? origin,
    LocationData? destination,
  }) {
    return SelectedLocations(
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
    );
  }

  bool get isReady => origin != null && destination != null;
}
