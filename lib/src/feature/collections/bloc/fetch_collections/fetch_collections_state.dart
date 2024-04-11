part of 'fetch_collections_bloc.dart';

@freezed
class FetchCollectionsState with _$FetchCollectionsState {
  const factory FetchCollectionsState.initial() = _Initial;

  const factory FetchCollectionsState.loading({
    @Default([]) final List<CollectionModel> oldCollections,
  }) = _Loading;

  const factory FetchCollectionsState.success({
    required final List<CollectionModel> collections,
  }) = _Success;

  const factory FetchCollectionsState.empty() = _Empty;

  const factory FetchCollectionsState.failure({
    required final String message,
    @Default([]) final List<CollectionModel> oldCollections,
  }) = _Failure;
}
