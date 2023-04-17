import 'package:nb_utils/nb_utils.dart';
import 'package:skyfy/src/domain/models/models.dart';
import 'package:skyfy/src/ui/screens/about/about_screen.dart';
import 'package:skyfy/src/ui/screens/aircrafts/aircraft_creen.dart';
import 'package:skyfy/src/ui/screens/companies/companies.dart';
import 'package:skyfy/src/ui/screens/contact/contact_us_screen.dart';
import 'package:skyfy/src/ui/screens/faq/faq_screen.dart';
import 'package:skyfy/src/ui/screens/home/home2.dart';
import 'package:skyfy/src/ui/screens/payment/payment_screen.dart';
import 'package:skyfy/src/ui/screens/profile/profile_screen_client.dart';
import 'package:skyfy/src/ui/screens/reviews/review_screen.dart';
import 'package:skyfy/src/ui/screens/security/forgot_pwd_screen.dart';
import 'package:skyfy/src/tools/constants.dart';

List<ListModel> getDrawerItems() {
  List<ListModel> drawerItems = [];

  drawerItems.add(ListModel(name: 'Admins', widget: const HomeScreen2()));
  drawerItems
      .add(ListModel(name: 'Companies', widget: const CompaniesScreen()));
  drawerItems
      .add(ListModel(name: 'Aircrafts', widget: const AircraftsScreen()));
  drawerItems.add(ListModel(name: 'Pilots', widget: const HomeScreen2()));
  drawerItems
      .add(ListModel(name: 'Profile', widget: const ProfileScreenClient()));
  drawerItems.add(ListModel(name: 'Payment', widget: const PaymentScreen()));
  drawerItems
      .add(ListModel(name: 'Forgot Password', widget: const ForgotPwdScreen()));
  drawerItems.add(ListModel(name: 'About', widget: const AboutScreen()));

  if (isMobile) {
    drawerItems
        .add(ListModel(name: 'Contact Us', widget: const ContactUsScreen()));
  }

  drawerItems
      .add(ListModel(name: 'Review & Rating', widget: const ReviewScreen()));
  drawerItems.add(ListModel(name: 'FAQ', widget: const FAQScreen()));
  //drawerItems.add(ListModel(name: 'No Internet', widget: DTNoInternetScreen()));
  // drawerItems.add(ListModel(name: 'No Data', widget: const HomeScreen2()));
  // drawerItems.add(ListModel(name: 'Error', widget: const HomeScreen2()));
  // drawerItems.add(ListModel(name: 'Maintenance', widget: const HomeScreen2()));
  // drawerItems.add(ListModel(name: 'Grid View', widget: const HomeScreen2()));
  // drawerItems
  //     .add(ListModel(name: 'Order Summary', widget: const HomeScreen2()));
  // drawerItems
  //     .add(ListModel(name: 'Address Manager', widget: const HomeScreen2()));
  //drawerItems.add(ListModel(name: 'Search', widget: const HomeScreen2()));
  //drawerItems.add(ListModel(name: 'No Result', widget: const HomeScreen2()));
  return drawerItems;
}

List<ReviewModel> getReviewList() {
  List<ReviewModel> list = [];

  ReviewModel r1 = ReviewModel();
  r1.name = "John smith";
  r1.comment = skyFyShortText;
  r1.ratting = 2.0;
  list.add(r1);
  ReviewModel r2 = ReviewModel();
  r2.name = "Lora";
  r2.comment = skyFyShortText;
  r2.ratting = 4.0;
  list.add(r2);
  ReviewModel r3 = ReviewModel();
  r3.name = "Isabella";
  r3.comment = skyFyShortText;
  r3.ratting = 5.0;
  list.add(r3);
  ReviewModel r4 = ReviewModel();
  r4.name = "Emma";
  r4.comment = skyFyShortText;
  r4.ratting = 3.0;
  list.add(r4);
  ReviewModel r5 = ReviewModel();
  r5.name = "John";
  r5.comment = skyFyShortText;
  r5.ratting = 5.0;
  list.add(r5);
  ReviewModel r6 = ReviewModel();
  r6.name = "Nora";
  r6.comment = skyFyShortText;
  r6.ratting = 3.0;
  list.add(r6);
  ReviewModel r7 = ReviewModel();
  r7.name = "Nora";
  r7.comment = skyFyShortText;
  r7.ratting = 3.0;
  list.add(r7);
  ReviewModel r8 = ReviewModel();
  r8.name = "John";
  r8.comment = skyFyShortText;
  r8.ratting = 5.0;
  list.add(r8);

  return list;
}
