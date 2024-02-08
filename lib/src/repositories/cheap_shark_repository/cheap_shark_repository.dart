import 'dart:isolate';

import 'package:lesgo/src/models/models.dart';
import 'package:lesgo/src/repositories/repositories.dart';
import 'package:lesgo/src/utils/string_extension.dart';

const _baseURL = "https://www.cheapshark.com/api/1.0";

final class CheapSharkRepository extends Repository {
  CheapSharkRepository({super.client, super.baseURL = _baseURL});
  Future<List<Deal>> getDeals({
    int pageNumber = 0,
  }) async {
    final uri = Uri.parse("$baseURL/deals").replace(queryParameters: {
      "pageNumber": "$pageNumber",
    });

    final data = await Isolate.run(
      () async {
        final res = await get(uri);

        if (res != null) {
          return res.toJsonList().map(Deal.fromJson).toList();
        } else {
          return <Deal>[];
        }
      },
      debugName: 'CheapSharkRepository: getDeals request',
    );

    return data;
  }
}
