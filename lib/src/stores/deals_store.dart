// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:lesgo/src/models/models.dart';
import 'package:lesgo/src/repositories/cheap_shark_repository/cheap_shark_repository.dart';

part 'deals_store.g.dart';

class DealsStore = _DealsStore with _$DealsStore;

abstract class _DealsStore with Store {
  final _repo = CheapSharkRepository();

  static final ObservableFuture<List<Deal>> _emptyResponse =
      ObservableFuture.value([]);

  @readonly
  int _page = 0;

  @readonly
  @MakeObservable(useDeepEquality: true)
  List<Deal> _deals = [];

  @readonly
  ObservableFuture<List<Deal>> _fetchDealsFuture = _emptyResponse;

  @readonly
  ObservableFuture<List<Deal>> _fetchMoreDealsFuture = _emptyResponse;

  @computed
  bool get hasDealsResults =>
      _fetchDealsFuture != _emptyResponse &&
      _fetchDealsFuture.status == FutureStatus.fulfilled;

  @computed
  bool get hasMoreDealsResults =>
      _fetchMoreDealsFuture != _emptyResponse &&
      _fetchMoreDealsFuture.status == FutureStatus.fulfilled;

  @action
  Future<void> fetchDeals({int pageNumber = 0}) async {
    final future = _repo.getDeals(pageNumber: pageNumber);
    _fetchDealsFuture = ObservableFuture(future);

    _deals = await future;
  }

  @action
  Future<void> loadMoreDeals() async {
    if (_fetchMoreDealsFuture.status == FutureStatus.pending) {
      return;
    }

    // Increment the page count by 1
    _page += 1;

    final future = _repo.getDeals(pageNumber: _page);
    _fetchMoreDealsFuture = ObservableFuture(future);

    final deals = await future;

    _deals.addAll(deals);
  }
}
