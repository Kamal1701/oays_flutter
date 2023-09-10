class CustomerRegistration {
  String userName;
  String userLocation;
  bool isMerchant;
  String shopName;
  String shopStreetName;
  String shopCity;
  String shopState;
  String shopPincode;
  // DateTime createdDate;

  CustomerRegistration(
    this.userName,
    this.userLocation,
    this.isMerchant,
    this.shopName,
    this.shopStreetName,
    this.shopCity,
    this.shopState,
    this.shopPincode,
  );

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userLocation': userLocation,
      'isMerchant': isMerchant,
      'shopName': shopName,
      'shopStreetName': shopStreetName,
      'shopCity': shopCity,
      'shopState': shopState,
      'shopPincode': shopPincode,
    };
  }

  factory CustomerRegistration.fromMap(Map<String, dynamic> data) {
    return CustomerRegistration(
      data['userName'],
      data['userLocation'],
      data['isMerchant'],
      data['shopName'],
      data['shopStreetName'],
      data['shopCity'],
      data['shopState'],
      data['shopPincode'],
    );
  }

  // CustomerRegistration.fromDocumentSnapShot(
  //     DocumentSnapshot<Map<String, dynamic>> docSnap)
  //     : userName = docSnap.data()!['userName'],
  //       userLocation = docSnap.data()!['userLocation'];
}
