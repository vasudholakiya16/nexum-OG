import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/Community%20screen/community_page.dart';
import 'package:flutter_application_2/super_admin/userprofile.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadItem extends StatefulWidget {
  const UploadItem({super.key});

  @override
  State<UploadItem> createState() => _UploadItemState();
}

class _UploadItemState extends State<UploadItem> {
  TextEditingController sellerNameController = TextEditingController();
  TextEditingController sellerPhoneNumberController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemDescriptionController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();

  Uint8List? imageBytesFilesUint8List;
  bool isUploading = false;

  // Initialize selectedOptions2 in the State class
  List<bool> selectedOptions2 = [true, false];

  // final mediaQuery = MediaQuery.of(context);
  // final screenWidth = mediaQuery.size.width;
  // final screenHeight = mediaQuery.size.height;

// upload Item logic goes here
  Widget uploadItemForScreen() {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Upload Item',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              // upload item logic goes here
            },
            icon: const Icon(Icons.cloud_upload_outlined),
            color: Colors.white,
            focusColor: Colors.grey[100],
          )
        ],
      ),
      body: ListView(
        children: [
          isUploading == true
              ? LinearProgressIndicator(
                  color: Colors.purple[400],
                )
              : Container(),

          // add images here
          SizedBox(
            height: 230,
            width: MediaQuery.of(context).size.width * 0.8,
            child: imageBytesFilesUint8List == null
                ? const Icon(
                    Icons.image_not_supported_outlined,
                    color: Colors.white,
                  )
                : Image.memory(
                    imageBytesFilesUint8List!,
                    fit: BoxFit.cover,
                  ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 2,
          ),

          Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOptions2 = [true, false];
                            });
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Memories',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: selectedOptions2[0]
                                          ? Colors.white
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              if (selectedOptions2[0])
                                Container(
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black, // Underline color
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOptions2 = [false, true];
                            });
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Events',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: selectedOptions2[1]
                                          ? Colors.white
                                          : Colors.grey, // Dynamic color
                                    ),
                                  ),
                                ],
                              ),
                              if (selectedOptions2[1])
                                Container(
                                  // margin: const EdgeInsets.only(top: 5),
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black, // Underline color
                                  ),
                                  // color: Colors.black, // Underline color
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // const SizedBox(height: 20),
                if (selectedOptions2[0])
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.4, // Adjust height as needed
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, // Number of columns
                              crossAxisSpacing: 7, // Spacing between columns
                              mainAxisSpacing: 10, // Spacing between rows
                            ),
                            itemCount: 10, // Number of images to display
                            itemBuilder: (context, index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                borderOnForeground: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/profileImg.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                if (selectedOptions2[1])
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.6, // Constrain height
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        List<String> communityImage = [
                          'assets/images/Rectangle 195.png',
                          'assets/images/Rectangle 196.png',
                          'assets/images/Rectangle 195.png',
                          'assets/images/Rectangle 196.png',
                          'assets/images/Rectangle 195.png',
                        ];
                        List<String> communityTitle = [
                          'GDSC-PU',
                          'AWS-PU',
                          'GDSC-PU',
                          'AWS-PU',
                          'GDSC-PU',
                        ];
                        List<String> communitySubtitle = [
                          'Google developers student club is a club for students in which',
                          'Amazon web services',
                          'Google developers student club is a club for students in which',
                          'Amazon web services',
                          'Google developers student club is a club for students in which',
                        ];

                        Color cardColor = Color(0xffFFFFFF);

                        return GestureDetector(
                          onTap: () {
                            print("Tapped on ${communityTitle[index]}");
                            Get.to(const CommunityPage());
                          },
                          child: Card(
                            color:
                                cardColor, // Set background color of the Card
                            elevation: 4.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 10.0),
                            child: ListTile(
                              title: Text(
                                communityTitle[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                communitySubtitle[index],
                                style: const TextStyle(color: Colors.grey),
                              ),
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage(communityImage[index]),
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget defaultScreen() {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Upload Item',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.add_photo_alternate_outlined,
            color: Colors.white,
            size: 200,
          ),
          ElevatedButton(
            onPressed: () {
              showDialogBox();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black54,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
            ),
            child: const Text(
              'Upload Image',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      )),
    );
  }

  showDialogBox() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.black,
            title: const Text(
              'item Image',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  // capture image with camera logic goes here
                  captureImageWithCamera();
                },
                child: const Text(
                  'Capture Image with Camera',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // select image from gallery logic goes here
                  selectImageFromGallery();
                },
                child: const Text(
                  'Select Image from Gallery',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        });
  }

  captureImageWithCamera() async {
    Navigator.pop(context);
    // capture image with camera logic goes here
    try {
      // capture image with camera logic goes here
      final pickImage =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (pickImage != null) {
        String imagePath = pickImage.path;
        imageBytesFilesUint8List = await pickImage.readAsBytes();
        if (kDebugMode) {
          print(imagePath);
        }
        // remove background for image
        setState(() {
          imageBytesFilesUint8List;
        });
      }
    } catch (e) {
      if (e is PlatformException) {
        if (e.code == 'camera_access_denied') {
          print('Camera access denied');
        }
      }
      setState(() {
        imageBytesFilesUint8List = null;
      });
    }
  }

  selectImageFromGallery() async {
    // select image from gallery logic goes here
    Navigator.pop(context);

    // capture image with camera logic goes here
    try {
      // capture image with camera logic goes here
      final pickImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickImage != null) {
        String imagePath = pickImage.path;
        imageBytesFilesUint8List = await pickImage.readAsBytes();
        if (kDebugMode) {
          print(imagePath);
        }
        // remove background for image
        setState(() {
          imageBytesFilesUint8List;
        });
      }
    } catch (e) {
      if (e is PlatformException) {
        if (e.code == 'camera_access_denied') {
          print('Camera access denied');
        }
      }
      setState(() {
        imageBytesFilesUint8List = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return imageBytesFilesUint8List == null
        ? defaultScreen()
        : ClubDetailsScreen(
            clubId: '1478',
          );
  }
}
//userCredential.user!.uid

class ClubDetailsScreen extends StatelessWidget {
  final String clubId; // Pass the club ID to this screen if needed

  const ClubDetailsScreen({super.key, required this.clubId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Club Details'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('all_clubs')
            .doc(clubId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('No data found.'));
          }

          // Extract the data from the snapshot
          final data = snapshot.data!.data() as Map<String, dynamic>;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Club Type: ${data['clubType']}',
                    style: const TextStyle(fontSize: 18)),
              ],
            ),
          );
        },
      ),
    );
  }
}
