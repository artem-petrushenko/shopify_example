part of 'fetch_collections_bloc.dart';

@freezed
class FetchCollectionsEvent with _$FetchCollectionsEvent {
  const factory FetchCollectionsEvent.fetchCollections({
    final Completer<void>? completer,
  }) = _FetchCollections;
}
