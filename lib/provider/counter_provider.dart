// viết 1 lớp để quản lí trạng thái

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Counter_provider extends ChangeNotifier{
  // định nghĩa trạng thái của mình , cái mà hiển thị lên giao diện
  int _value = 0;//bien 1 _ laf bien private,tao geter setter de truy cap den bien

  //int get value => _value;// la trang thai cua ung dung
 Future <int> getValue () async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _value = await sharedPreferences.getInt("Counter_provider", ) ?? 0; // th null tra ve k vi key chua co
    return _value;
  }

  set value(int value) {
    _value = value;
  } //

  // pt khoi tao
//   Counter_provider() asy  {
//
// }
  void increament() async {
    _value++;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("Counter_provider", _value).whenComplete(() => notifyListeners() );
    //notifyListeners();// sau khi tang muon cap nhat lai thi goi notifylistenner

  }
}