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
      body: _DealsPageBody(store: _dealsStore),
    );
  }
}

class _DealsPageBody extends StatelessWidget {
  const _DealsPageBody({required this.store});

  final DealsStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => switch (store.fetchDealsFuture.status) {
        FutureStatus.pending => const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator.adaptive(),
                SizedBox.square(
                  dimension: 4,
                ),
                Text('Loading'),
              ],
            ),
          ),
        FutureStatus.rejected => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
          ),
        FutureStatus.fulfilled => DealsListViewWidget(store: store),
      },
    );
  }
}
