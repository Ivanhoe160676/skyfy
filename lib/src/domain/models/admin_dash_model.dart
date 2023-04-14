// ignore_for_file: prefer_typing_uninitialized_variables

class CategoryDataModel {
  var name = "";
  var image = "";
}

class BestDestinationDataModel {
  var name = "";
  var rating = "";
  var image = "";
}

class RecentSearchDataModel {
  var name = "";
}

class BestHotelDataModel {
  var name = "";
  var rating = "";
  var image = "";
}

class HotelDataModel {
  var name = "";
  var rating = "";
  var address = "";

  // ignore: non_constant_identifier_names
  var room_detail = "";

  // ignore: non_constant_identifier_names
  var hotel_review = "";
  var image = "";
  var price = "";
}

class T10Product {
  var name;
  var price;
  var subPrice;
  var img;
  var category;

  T10Product(
    this.name,
    this.price,
    this.subPrice,
    this.img,
    this.category,
  );
}

class T10Images {
  var img;

  T10Images(this.img);
}
