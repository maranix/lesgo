import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lesgo/src/models/models.dart';
import 'package:lesgo/src/stores/deals_store.dart';
import 'package:share_plus/share_plus.dart';

class DealsListViewWidget extends StatefulWidget {
  const DealsListViewWidget({
    super.key,
    required this.store,
  });

  final DealsStore store;

  @override
  State<DealsListViewWidget> createState() => _DealsListViewWidgetState();
}

class _DealsListViewWidgetState extends State<DealsListViewWidget> {
  late ScrollController _scrollController;

  void _autoFetchNearBottom() {
    const fetchThreshold = 150;
    final scrollDelta = _scrollController.position.maxScrollExtent.floor() -
        _scrollController.offset.floor();

    if (scrollDelta < fetchThreshold) {
      widget.store.loadMoreDeals().whenComplete(() {
        Fluttertoast.cancel();
        Fluttertoast.showToast(msg: 'Fetching more deals');
        setState(() {});
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(_autoFetchNearBottom);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      name: 'DealsListViewWidget',
      builder: (_) {
        final deals = widget.store.deals;

        if (!widget.store.hasDealsResults) {
          return const SizedBox.shrink();
        }

        if (deals.isEmpty) {
          return const Center(
            child: Text('We could not find any deals'),
          );
        }

        return ListView.separated(
          controller: _scrollController,
          itemCount: widget.store.deals.length,
          itemBuilder: (_, index) {
            final deal = deals.elementAt(index);

            return _DealsListViewItemWidget(
              key: ObjectKey(deal),
              deal: deal,
            );
          },
          separatorBuilder: (_, index) => const SizedBox.square(dimension: 12),
        );
      },
    );
  }
}

class _DealsListViewItemWidget extends StatelessWidget {
  const _DealsListViewItemWidget({
    super.key,
    required this.deal,
  });

  final Deal deal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 250,
              minWidth: 175,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(deal.thumb),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox.square(dimension: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deal.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox.square(dimension: 8),
                Text("Deal Rating: ${deal.dealRating}"),
                Text("Steam Rating: ${deal.steamRatingPercent}%"),
                Text("On Sale: ${deal.isOnSale}"),
                Text("Normal Price: ${deal.normalPrice}\$"),
                Text("Sale Price: ${deal.salePrice}\$"),
                Text("Metacritic Score: ${deal.metacriticScore}%"),
                const SizedBox.square(dimension: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () async {
                    final uri = Uri.https('https://store.steampowered.com',
                        'app/${deal.steamAppId}');
                    await Share.shareUri(uri);
                  },
                  child: Text(
                    "Share",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
