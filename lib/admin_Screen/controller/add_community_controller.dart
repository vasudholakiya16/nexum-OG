// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class AddCommunityController extends GetxController {
//   var sellerNameController = TextEditingController();
//   var sellerPhoneNumberController = TextEditingController();
//   var itemNameController = TextEditingController();
//   var itemDescriptionController = TextEditingController();
//   var itemPriceController = TextEditingController();

//   var imageBytesFilesUint8List = Rx<Uint8List?>(null);
//   var isUploading = false.obs;

//   var categories = ['Official Club', 'Unofficial Club'].obs;
//   var selectedCategory = 'Official Club'.obs;

//   Future<void> captureImageWithCamera() async {
//     try {
//       final pickImage =
//           await ImagePicker().pickImage(source: ImageSource.camera);
//       if (pickImage != null) {
//         imageBytesFilesUint8List.value = await pickImage.readAsBytes();
//       }
//     } catch (e) {
//       imageBytesFilesUint8List.value = null;
//     }
//   }

//   Future<void> selectImageFromGallery() async {
//     try {
//       final pickImage =
//           await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (pickImage != null) {
//         imageBytesFilesUint8List.value = await pickImage.readAsBytes();
//       }
//     } catch (e) {
//       imageBytesFilesUint8List.value = null;
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

class AddCommunityController extends GetxController {
  var imageBytesFilesUint8List = Rxn<Uint8List>();
  var selectedCategory = 'Memory'.obs;
  var selectedClubType = 'Official Club'.obs; // New field for club type
  var categories = ['Memory', 'Event'].obs;
  var clubTypes = ['Official Club', 'Unofficial Club'].obs;

  // Text controllers for item details
  TextEditingController sellerPhoneNumberController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemDescriptionController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();
  TextEditingController eventLocationController = TextEditingController();
  TextEditingController eventDateController = TextEditingController();
  TextEditingController officialClubTitleController = TextEditingController();
  TextEditingController unofficialClubTitleController = TextEditingController();

  // Firebase Firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Handle image picking (from gallery or camera)
  void captureImageWithCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imageBytesFilesUint8List.value = await pickedFile.readAsBytes();
    }
  }

  void selectImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageBytesFilesUint8List.value = await pickedFile.readAsBytes();
    }
  }

  // Handle data upload to Firestore
  Future<void> uploadData() async {
    // Prepare data based on category selection
    if (selectedCategory.value == 'Memory') {
      await uploadMemory();
    } else if (selectedCategory.value == 'Event') {
      await uploadEvent();
    }
  }

  Future<void> uploadMemory() async {
    // Upload memory data with images
    await firestore.collection('memories').add({
      'item_name': itemNameController.text,
      'description': itemDescriptionController.text,
      'price': itemPriceController.text,
      'phone_number': sellerPhoneNumberController.text,
      'images': FieldValue.arrayUnion([imageBytesFilesUint8List.value]),
      'club_type': selectedClubType.value,
      'official_title': officialClubTitleController.text,
      'unofficial_title': unofficialClubTitleController.text,
    });
  }

  Future<void> uploadEvent() async {
    // Upload event data with date and location
    await firestore.collection('events').add({
      'event_name': itemNameController.text,
      'description': itemDescriptionController.text,
      'price': itemPriceController.text,
      'phone_number': sellerPhoneNumberController.text,
      'location': eventLocationController.text,
      'event_date': eventDateController.text,
    });
  }
}
