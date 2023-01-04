class SliderObject {
  String title;
  String subtitle;
  String image;
  SliderObject(
      {required this.title, required this.subtitle, required this.image});
}

class Customer {
  String id;
  String name;
  int notification;
  Customer(this.id, this.name, this.notification);
}

class Contacts {
  String email;
  String phone;
  Contacts(this.email, this.phone);
}

class Authentication {
  Customer customer;
  Contacts contacts;
  Authentication(this.customer, this.contacts);
}
