// viết 1 lớp để quản lí trạng thái

import 'package:flutter/foundation.dart';

class Counter_provider extends ChangeNotifier{
  // định nghĩa trạng thái của mình , cái mà hiển thị lên giao diện
  int _value = 0;//bien 1 _ laf bien private,tao geter setter de truy cap den bien

  int get value => _value;// la trang thai cua ung dung

  set value(int value) {
    _value = value;
  } //

  void increament(){
    _value++;
    notifyListeners();// sau khi tang muon cap nhat lai thi goi notifylistenner

  }
}