// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/admin_Screen/controller/add_community_controller.dart';
// import 'package:get/get.dart';

// class AddCommunity extends StatelessWidget {
//   const AddCommunity({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final AddCommunityController controller = Get.put(AddCommunityController());

//     return Obx(() {
//       return controller.imageBytesFilesUint8List.value == null
//           ? DefaultScreen(controller: controller)
//           : UploadItemScreen(controller: controller);
//     });
//   }
// }

// class DefaultScreen extends StatelessWidget {
//   final AddCommunityController controller;

//   const DefaultScreen({required this.controller, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('Upload Item', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.add_photo_alternate_outlined,
//                 size: 200, color: Colors.white),
//             ElevatedButton(
//               onPressed: () => _showDialogBox(context),
//               style:
//                   ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
//               child: const Text('Upload Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showDialogBox(BuildContext context) {
//     Get.dialog(
//       SimpleDialog(
//         title: const Text('Item Image'),
//         children: [
//           SimpleDialogOption(
//             onPressed: () {
//               Get.back();
//               controller.captureImageWithCamera();
//             },
//             child: const Text('Capture Image with Camera'),
//           ),
//           SimpleDialogOption(
//             onPressed: () {
//               Get.back();
//               controller.selectImageFromGallery();
//             },
//             child: const Text('Select Image from Gallery'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class UploadItemScreen extends StatelessWidget {
//   final AddCommunityController controller;

//   const UploadItemScreen({required this.controller, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffFFFCEF),
//       appBar: AppBar(
//         backgroundColor: const Color(0xffFFFCEF),
//         title: const Text(
//           'Add Community',
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () {
//               // upload item logic goes here
//             },
//             icon: const Icon(Icons.cloud_upload_outlined),
//             color: Colors.black,
//             focusColor: Colors.grey[100],
//           )
//         ],
//       ),
//       body: Obx(() {
//         return ListView(
//           children: [
//             controller.isUploading.value
//                 ? LinearProgressIndicator(color: Colors.purple[400])
//                 : Container(),
//             SizedBox(
//               height: 230,
//               child: controller.imageBytesFilesUint8List.value == null
//                   ? const Icon(Icons.image_not_supported_outlined,
//                       size: 100, color: Colors.black)
//                   : Image.memory(controller.imageBytesFilesUint8List.value!),
//             ),

//             // Dropdown Menu
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Obx(() {
//                 return DropdownButtonFormField<String>(
//                   value: controller.selectedCategory.value,
//                   items: controller.categories
//                       .map((category) => DropdownMenuItem<String>(
//                             value: category,
//                             child: Text(category),
//                           ))
//                       .toList(),
//                   onChanged: (value) {
//                     controller.selectedCategory.value = value!;
//                   },
//                   decoration: const InputDecoration(
//                     labelText: 'Select Category',
//                     border: OutlineInputBorder(),
//                   ),
//                 );
//               }),
//             ),
//             const Divider(thickness: 2),
//             _buildTextField(
//               'Phone Number',
//               controller.sellerPhoneNumberController,
//               Icons.phone,
//               inputType: TextInputType.phone,
//             ),
//             _buildTextField(
//                 'Item Name', controller.itemNameController, Icons.shopping_bag),
//             _buildTextField('Description', controller.itemDescriptionController,
//                 Icons.description),
//             _buildTextField(
//               'Price',
//               controller.itemPriceController,
//               Icons.money,
//               inputType: TextInputType.number,
//             ),
//           ],
//         );
//       }),
//     );
//   }

//   Widget _buildTextField(
//     String hintText,
//     TextEditingController controller,
//     IconData icon, {
//     TextInputType inputType = TextInputType.text,
//   }) {
//     return Column(
//       children: [
//         ListTile(
//           leading: Icon(icon, color: Colors.black),
//           title: TextField(
//             controller: controller,
//             keyboardType: inputType,
//             decoration: InputDecoration(
//               hintText: hintText,
//               border: InputBorder.none,
//             ),
//           ),
//         ),
//         const Divider(thickness: 1),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_2/admin_Screen/controller/add_community_controller.dart';

class AddCommunity extends StatelessWidget {
  const AddCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    final AddCommunityController controller = Get.put(AddCommunityController());

    return Obx(() {
      return controller.imageBytesFilesUint8List.value == null
          ? DefaultScreen(controller: controller)
          : UploadItemScreen(controller: controller);
    });
  }
}

class DefaultScreen extends StatelessWidget {
  final AddCommunityController controller;

  const DefaultScreen({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Upload Item', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_photo_alternate_outlined,
                size: 200, color: Colors.white),
            ElevatedButton(
              onPressed: () => _showDialogBox(context),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
              child: const Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialogBox(BuildContext context) {
    Get.dialog(
      SimpleDialog(
        title: const Text('Item Image'),
        children: [
          SimpleDialogOption(
            onPressed: () {
              Get.back();
              controller.captureImageWithCamera();
            },
            child: const Text('Capture Image with Camera'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Get.back();
              controller.selectImageFromGallery();
            },
            child: const Text('Select Image from Gallery'),
          ),
        ],
      ),
    );
  }
}

class UploadItemScreen extends StatelessWidget {
  final AddCommunityController controller;

  const UploadItemScreen({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFCEF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFCEF),
        title: const Text(
          'Add Community',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.uploadData(); // Upload data to Firestore
            },
            icon: const Icon(Icons.cloud_upload_outlined),
            color: Colors.black,
            focusColor: Colors.grey[100],
          )
        ],
      ),
      body: Obx(() {
        return ListView(
          children: [
            controller.isUploading.value
                ? LinearProgressIndicator(color: Colors.purple[400])
                : Container(),
            SizedBox(
              height: 230,
              child: controller.imageBytesFilesUint8List.value == null
                  ? const Icon(Icons.image_not_supported_outlined,
                      size: 100, color: Colors.black)
                  : Image.memory(controller.imageBytesFilesUint8List.value!),
            ),

            // Dropdown for Category
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Obx(() {
                return DropdownButtonFormField<String>(
                  value: controller.selectedCategory.value,
                  items: controller.categories
                      .map((category) => DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.selectedCategory.value = value!;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Select Category',
                    border: OutlineInputBorder(),
                  ),
                );
              }),
            ),
            const Divider(thickness: 2),

            // Dropdown for Club Type (Official/Unofficial)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Obx(() {
                return DropdownButtonFormField<String>(
                  value: controller.selectedClubType.value,
                  items: controller.clubTypes
                      .map((clubType) => DropdownMenuItem<String>(
                            value: clubType,
                            child: Text(clubType),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.selectedClubType.value = value!;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Select Club Type',
                    border: OutlineInputBorder(),
                  ),
                );
              }),
            ),
            const Divider(thickness: 2),

            // Show fields based on Club Type selection
            if (controller.selectedClubType.value == 'Official Club') ...[
              _buildTextField(
                'Official Club Title',
                controller.officialClubTitleController,
                Icons.star,
              ),
            ] else if (controller.selectedClubType.value ==
                'Unofficial Club') ...[
              _buildTextField(
                'Unofficial Club Title',
                controller.unofficialClubTitleController,
                Icons.label,
              ),
            ],

            // Other fields for item details
            _buildTextField(
              'Phone Number',
              controller.sellerPhoneNumberController,
              Icons.phone,
              inputType: TextInputType.phone,
            ),
            _buildTextField(
                'Item Name', controller.itemNameController, Icons.shopping_bag),
            _buildTextField('Description', controller.itemDescriptionController,
                Icons.description),
            _buildTextField(
              'Price',
              controller.itemPriceController,
              Icons.money,
              inputType: TextInputType.number,
            ),
          ],
        );
      }),
    );
  }

  Widget _buildTextField(
    String hintText,
    TextEditingController controller,
    IconData icon, {
    TextInputType inputType = TextInputType.text,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black),
          title: TextField(
            controller: controller,
            keyboardType: inputType,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}
