// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deals_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DealsStore on _DealsStore, Store {
  Computed<bool>? _$hasDealsResultsComputed;

  @override
  bool get hasDealsResults =>
      (_$hasDealsResultsComputed ??= Computed<bool>(() => super.hasDealsResults,
              name: '_DealsStore.hasDealsResults'))
          .value;
  Computed<bool>? _$hasMoreDealsResultsComputed;

  @override
  bool get hasMoreDealsResults => (_$hasMoreDealsResultsComputed ??=
          Computed<bool>(() => super.hasMoreDealsResults,
              name: '_DealsStore.hasMoreDealsResults'))
      .value;

  late final _$_pageAtom = Atom(name: '_DealsStore._page', context: context);

  int get page {
    _$_pageAtom.reportRead();
    return super._page;
  }

  @override
  int get _page => page;

  @override
  set _page(int value) {
    _$_pageAtom.reportWrite(value, super._page, () {
      super._page = value;
    });
  }

  late final _$_dealsAtom = Atom(name: '_DealsStore._deals', context: context);

  List<Deal> get deals {
    _$_dealsAtom.reportRead();
    return super._deals;
  }

  @override
  List<Deal> get _deals => deals;

  @override
  set _deals(List<Deal> value) {
    _$_dealsAtom.reportWrite(value, super._deals, () {
      super._deals = value;
    });
  }

  late final _$_fetchDealsFutureAtom =
      Atom(name: '_DealsStore._fetchDealsFuture', context: context);

  ObservableFuture<List<Deal>> get fetchDealsFuture {
    _$_fetchDealsFutureAtom.reportRead();
    return super._fetchDealsFuture;
  }

  @override
  ObservableFuture<List<Deal>> get _fetchDealsFuture => fetchDealsFuture;

  @override
  set _fetchDealsFuture(ObservableFuture<List<Deal>> value) {
    _$_fetchDealsFutureAtom.reportWrite(value, super._fetchDealsFuture, () {
      super._fetchDealsFuture = value;
    });
  }

  late final _$_fetchMoreDealsFutureAtom =
      Atom(name: '_DealsStore._fetchMoreDealsFuture', context: context);

  ObservableFuture<List<Deal>> get fetchMoreDealsFuture {
    _$_fetchMoreDealsFutureAtom.reportRead();
    return super._fetchMoreDealsFuture;
  }

  @override
  ObservableFuture<List<Deal>> get _fetchMoreDealsFuture =>
      fetchMoreDealsFuture;

  @override
  set _fetchMoreDealsFuture(ObservableFuture<List<Deal>> value) {
    _$_fetchMoreDealsFutureAtom.reportWrite(value, super._fetchMoreDealsFuture,
        () {
      super._fetchMoreDealsFuture = value;
    });
  }

  late final _$fetchDealsAsyncAction =
      AsyncAction('_DealsStore.fetchDeals', context: context);

  @override
  Future<void> fetchDeals({int pageNumber = 0}) {
    return _$fetchDealsAsyncAction
        .run(() => super.fetchDeals(pageNumber: pageNumber));
  }

  late final _$loadMoreDealsAsyncAction =
      AsyncAction('_DealsStore.loadMoreDeals', context: context);

  @override
  Future<void> loadMoreDeals() {
    return _$loadMoreDealsAsyncAction.run(() => super.loadMoreDeals());
  }

  @override
  String toString() {
    return '''
hasDealsResults: ${hasDealsResults},
hasMoreDealsResults: ${hasMoreDealsResults}
    ''';
  }
}
