class Passenger{
  String _name;
  String _phoneNumber;
  String _amount;
  String _seatNumber;

  get getName => _name;
  get getPhoneNumber => _phoneNumber;
  get getAmount => _amount;
  get getSeatNumber => _seatNumber;

  void setName(String n) =>_name = n;
  void setPhoneNumber(String pN) => _phoneNumber = pN;
  void setAmount(String a) => _amount = a;
  void setSeatNumber(String s) => _seatNumber = s;

}