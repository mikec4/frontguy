class Errors{
  String _passwordError;
  String _nameError;
  bool _hasPasswordError;
  bool _hasNameError;
  
  bool get isPasswordError => _hasPasswordError;
  bool get isNameError => _hasNameError;
  String get passwordError => _passwordError;
  String get nameError => _nameError;
  
  void isPasswordSet(bool e){
    _hasPasswordError = e;
  }
  void isNameSet(bool e){
    _hasNameError = e;
  }
  void setNameError(String e){
    _nameError = e;
  }
  void setPasswordError(String e){
    _passwordError = e;
  }
}