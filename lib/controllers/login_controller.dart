import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  TextEditingController get getName => _usernameController;
  TextEditingController get getPassword => _passwordController;
  TextEditingController get getEmail => _emailController;
  TextEditingController get getConfirmPassword => _confirmPasswordController;

  bool _isVisible = false;
  bool get isVisible => _isVisible;

  void toggleVisibility() {
    _isVisible = !isVisible;
    notifyListeners();
  }

  bool _isDisable = false;
  bool get isDisable => _isDisable;

  void isFilledSU() {
    if (getName.text.isNotEmpty &&
        getEmail.text.isNotEmpty &&
        getPassword.text.isNotEmpty &&
        getConfirmPassword.text.isNotEmpty) {
      _isDisable = true;
    } else {
      _isDisable = false;
    }
    notifyListeners();
  }

  void checkFormSU() {
    final valid  = 
        validateName(getName.text) == null &&
        validateEmail(getEmail.text) == null &&
        validatePassword(getPassword.text) == null &&
        validateConfirmPassword(getConfirmPassword.text) == null;
    _isDisable = valid;
    notifyListeners();
  }

//Kod tekrarlanir 
//Duzelt 
  void checkFormSI(){
    final valid = 
    validateEmail(getEmail.text) == null && 
    validatePassword(getPassword.text) == null ;

    _isDisable=valid;
    notifyListeners();
  }


  void isFilledSI(){
    if(getEmail.text.isNotEmpty &&
        getPassword.text.isNotEmpty){
          _isDisable = true;
        }else {
          _isDisable=false;
        }
      notifyListeners();
  }



  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  //Validasiyalar

  String? validateName(String? text){
    if( text == null || text.trim().length < 6){
      return 'Name must be at least 6 characters long';
    }
    return null;
  }

  String? validateEmail(String? text){
    final emailRegExp =   RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if(text==null || !emailRegExp.hasMatch(text.trim())){
      return 'Invalid email format';
    }
    return null;
  }

  String? validatePassword(String? text){
    if(text==null || text.trim().length < 8){
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  String? validateConfirmPassword(String? text){
    if(text==null || text.trim() != getPassword.text.trim()){
      return 'Passwords do not match';
    }
    return null;
  }


  void clearFields() {
    _usernameController.clear();
    _passwordController.clear();
    _emailController.clear();
    _confirmPasswordController.clear();
    notifyListeners();
  }

int _selectedIndex =0;
int get selectedIndex => _selectedIndex;

void onTapped(int index){
  _selectedIndex = index;
  notifyListeners();
  }
}
