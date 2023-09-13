import 'package:oays/models/customer_registration.dart';
import 'package:oays/services/database_services.dart';

class CustomerDataProvider {
  late CustomerRegistration currentUser;

  void getUserData() async {
    currentUser = DatabaseService().getCustomer() as CustomerRegistration;
  }

  // Future<CustomerRegistration?> customerRegistration =
  //     DatabaseService().getCustomer();

  CustomerRegistration get currentUserData {
    return currentUser;
  }
}
