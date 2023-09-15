class OfferProduct {
  // String offerProductId;
  String offerImageUrl;
  bool isOfferImageBlank;
  String offerProductName;
  String offerProductBrandName;
  String offerProductActualPrice;
  String offerProductDiscountPrice;
  String offerProductStartDate;
  String offerProductEndDate;
  String offerProductWeigh;
  String offerProductDiscountPerc;
  String offerProductDescription;

  OfferProduct(
      this.offerImageUrl,
      this.isOfferImageBlank,
      this.offerProductName,
      this.offerProductBrandName,
      this.offerProductActualPrice,
      this.offerProductDiscountPrice,
      this.offerProductStartDate,
      this.offerProductEndDate,
      this.offerProductWeigh,
      this.offerProductDiscountPerc,
      this.offerProductDescription);

  Map<String, dynamic> toMap() {
    return {
      'offerImageUrl': offerImageUrl,
      'isOfferImageBlank': isOfferImageBlank,
      'offerProductName': offerProductName,
      'offerProductBrandName': offerProductBrandName,
      'offerProductActualPrice': offerProductActualPrice,
      'offerProductDiscountPrice': offerProductDiscountPrice,
      'offerProductStartDate': offerProductStartDate,
      'offerProductEndDate': offerProductEndDate,
      'offerProductWeigh': offerProductWeigh,
      'offerProductDiscountPerc': offerProductDiscountPerc,
      'offerProductDescription': offerProductDescription
    };
  }

  factory OfferProduct.fromMap(Map<String, dynamic> data) {
    return OfferProduct(
      // data['offerProductId'],
      data['offerImageUrl'],
      data['isOfferImageBlank'],
      data['offerProductName'],
      data['offerProductBrandName'],
      data['offerProductActualPrice'],
      data['offerProductDiscountPrice'],
      data['offerProductStartDate'],
      data['offerProductEndDate'],
      data['offerProductWeigh'],
      data['offerProductDiscountPerc'],
      data['offerProductDescription'],
    );
  }
}
