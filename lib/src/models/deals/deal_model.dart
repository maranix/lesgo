import 'package:freezed_annotation/freezed_annotation.dart';

part 'deal_model.freezed.dart';
part 'deal_model.g.dart';

@freezed
class Deal with _$Deal {
  const factory Deal({
    required String internalName,
    required String title,
    required String? metacriticLink,
    required String dealID,
    required String storeID,
    required String gameID,
    required String salePrice,
    required String normalPrice,
    required String isOnSale,
    required String savings,
    required String metacriticScore,
    required String? steamRatingText,
    required String steamRatingPercent,
    required String steamRatingCount,
    required String? steamAppId,
    required int releaseDate,
    required int lastChange,
    required String dealRating,
    required String thumb,
  }) = _Deal;

  factory Deal.fromJson(Map<String, dynamic> json) => _$DealFromJson(json);
}
