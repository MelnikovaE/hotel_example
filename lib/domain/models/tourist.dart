
class Tourist {
    late String name;
    late String surname;
    late String birthday;
    late String citizenship;
    late String number;
    late String vilidity;

    Tourist({
    required this.name,
    required this.surname,
    required this.birthday,
    required this.citizenship,
    required this.number,
    required this.vilidity,
  });

  Tourist.undefined(){
    name = '';   
    surname = '';
    birthday = '';
    citizenship = '';
    number = '';
    vilidity = '';
  }
}
