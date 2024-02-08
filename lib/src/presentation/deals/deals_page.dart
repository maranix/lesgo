import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lesgo/src/presentation/deals/widgets/widgets.dart';
import 'package:lesgo/src/stores/deals_store.dart';
import 'package:mobx/mobx.dart';

class DealsPage extends StatefulWidget {
  const DealsPage({super.key});

  @override
  State<DealsPage> createState() => _DealsPageState();
}

class _DealsPageState extends State<DealsPage> {
  late DealsStore _dealsStore;

  @override
  void initState() {
    super.initState();

    _dealsStore = DealsStore()..fetchDeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deals'),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
      ),
      body: Center(
        child: Column(
          children: [
            _FailureWidget(store: _dealsStore),
            _LoadingIndicator(store: _dealsStore),
            Expanded(
              child: DealsListViewWidget(store: _dealsStore),
            ),
          ],
        ),
      ),
    );
  }
}

class _FailureWidget extends StatelessWidget {
  const _FailureWidget({
    required this.store,
  });

  final DealsStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      name: 'DealsFailureWidget',
      builder: (_) => switch (store.fetchDealsFuture.status) {
        FutureStatus.rejected => Column(
            children: [
              const Text('An error occurred while fetching deals'),
              const SizedBox.square(
                dimension: 4,
              ),
              TextButton(
                onPressed: store.fetchDeals,
                child: const Text('Retry'),
              ),
            ],
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({
    required this.store,
  });

  final DealsStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      name: 'DealsLoadingIndicator',
      builder: (_) => switch (store.fetchDealsFuture.status) {
        FutureStatus.pending => const Column(
            children: [
              CircularProgressIndicator.adaptive(),
              SizedBox.square(
                dimension: 4,
              ),
              Text('Loading'),
            ],
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
