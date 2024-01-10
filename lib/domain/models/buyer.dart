class Buyer {
    late String phone;
    late String email;

    Buyer({
    required this.phone,
    required this.email,
  });

  Buyer.undefined(){
    phone = '';   
    email = '';
  }
}
