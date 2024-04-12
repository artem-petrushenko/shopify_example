part of 'fetch_collection_bloc.dart';

@freezed
class FetchCollectionEvent with _$FetchCollectionEvent {
  const factory FetchCollectionEvent.fetchCollection({
    final Completer? completer,
  }) = _FetchCollectionEvent;
}
