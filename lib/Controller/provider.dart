import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class User extends ChangeNotifier{
  var age;
  void radio (value){
    age = value;
    notifyListeners();
  }
  void radioa (value){
    age = value;
    notifyListeners();
  }
  void radiob (value){
    age = value;
    notifyListeners();
  }


  File? images;

  File? get image => images;

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      images = File(pickedImage.path);
    } else {
      images = null;
    }
    notifyListeners();
  }




// XFile? _imageFile;
  // late String _imagePath;
  //
  // XFile? get imageFile => _imageFile;
  // String get imagePath => _imagePath;
  //
  // final ImagePicker _picker = ImagePicker();
  //
  // Future<void> pickImage() async {
  //   try {
  //     XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //     if (pickedFile != null) {
  //       _imageFile = pickedFile;
  //       _imagePath = pickedFile.path;
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     print("Error picking image: $e");
  //   }
  // }


  //
  // late List<Map<String, dynamic>> _users;
  //
  // UserProvider(List<Map<String, dynamic>> users) {
  //   _users = List<Map<String, dynamic>>.from(users);
  // }
  //
  // List<Map<String, dynamic>> get users => _users;
  //
  // void filterUsers(String keyword) {
  //   if (keyword.isEmpty) {
  //     _users = List<Map<String, dynamic>>.from(uu);
  //   } else {
  //     _users = List<Map<String, dynamic>>.from(uu.where((user) =>
  //         user["msg"].toString().toLowerCase().contains(keyword.toLowerCase())));
  //   }
  //   notifyListeners();
  // }
  //
  // void sortUsers() {
  //   _users.sort((a, b) => a["msg"].toString().compareTo(b["msg"].toString()));
  //   notifyListeners();
  // }
}