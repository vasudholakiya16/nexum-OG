import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/admin_Screen/admin_CommunityScreen/community/addReelsAndPost/addpost_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_manager/photo_manager.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final List<Widget> _mediaList = [];
  final List<File> path = [];
  File? _file;
  int currentPage = 0;
  int? lastPage;
  _fetchNewMedia() async {
    lastPage = currentPage;
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth) {
      List<AssetPathEntity> album =
          await PhotoManager.getAssetPathList(type: RequestType.image);
      List<AssetEntity> media =
          await album[0].getAssetListPaged(page: currentPage, size: 60);

      for (var asset in media) {
        if (asset.type == AssetType.image) {
          final file = await asset.file;
          if (file != null) {
            path.add(File(file.path));
            _file = path[0];
          }
        }
      }
      List<Widget> temp = [];
      for (var asset in media) {
        temp.add(
          FutureBuilder(
            future: asset.thumbnailDataWithSize(ThumbnailSize(200, 200)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done)
                return Container(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.memory(
                          snapshot.data!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );

              return Container();
            },
          ),
        );
      }
      setState(() {
        _mediaList.addAll(temp);
        currentPage++;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchNewMedia();
  }

  int indexx = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'New Post',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddPostTextScreen(_file!),
                  ));
                },
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 15.sp, color: Colors.blue),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 375.h,
                  child: GridView.builder(
                    itemCount: _mediaList.isEmpty ? _mediaList.length : 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                    ),
                    itemBuilder: (context, index) {
                      return _mediaList[indexx];
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 40.h,
                  color: Colors.white,
                  child: Row(
                    children: [
                      SizedBox(width: 10.w),
                      Text(
                        'Recent',
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: _mediaList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          indexx = index;
                          _file = path[index];
                        });
                      },
                      child: _mediaList[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/admin_Screen/admin_CommunityScreen/community/addpost_text.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:photo_manager/photo_manager.dart';

// class AddPostScreen extends StatefulWidget {
//   const AddPostScreen({super.key});

//   @override
//   State<AddPostScreen> createState() => _AddPostScreenState();
// }

// class _AddPostScreenState extends State<AddPostScreen> {
//   final List<Widget> _mediaList = [];
//   final List<File> path = [];
//   File? _file;
//   int currentPage = 0;
//   int? lastPage;

// // Request runtime permissions
//   // Request runtime permissions
//   _requestPermissions() async {
//     // Check for storage permission
//     var status = await Permission.storage.request();

//     if (status.isGranted) {
//       // If granted, fetch media
//       print("Permission granted");
//       _fetchNewMedia();
//     } else if (status.isDenied) {
//       // Handle permission denial gracefully, and guide users
//       print("Permission denied. Requesting again.");
//       _showPermissionExplanation();
//     } else if (status.isPermanentlyDenied) {
//       // If the permission is permanently denied, direct the user to app settings
//       print("Permission permanently denied. Please enable it from settings.");
//       openAppSettings(); // You can also show a dialog asking users to open settings
//     }
//   }

// // Optionally, show a dialog explaining why the permission is needed
//   _showPermissionExplanation() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Storage Permission'),
//           content: Text(
//               'We need storage permission to fetch images from your gallery.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 Permission.storage.request(); // Retry the permission request
//               },
//               child: Text('Grant Permission'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // Fetch new media from gallery
//   _fetchNewMedia() async {
//     lastPage = currentPage;
//     final PermissionState ps = await PhotoManager.requestPermissionExtend();
//     if (ps.isAuth) {
//       List<AssetPathEntity> album =
//           await PhotoManager.getAssetPathList(type: RequestType.image);
//       List<AssetEntity> media =
//           await album[0].getAssetListPaged(page: currentPage, size: 60);

//       List<Widget> temp = [];
//       for (var asset in media) {
//         if (asset.type == AssetType.image) {
//           final file = await asset.file;
//           if (file != null) {
//             path.add(File(file.path)); // Add file to path list
//           }

//           // Add thumbnail to the media list
//           temp.add(
//             FutureBuilder(
//               future: asset.thumbnailDataWithSize(ThumbnailSize(200, 200)),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   return Container(
//                     child: Stack(
//                       children: [
//                         Positioned.fill(
//                           child: Image.memory(
//                             snapshot.data!,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//                 return Container(); // Empty container while loading
//               },
//             ),
//           );
//         }
//       }

//       setState(() {
//         _mediaList.addAll(temp); // Add all thumbnails to the media list
//         currentPage++;
//       });
//     } else {
//       print("Permission not granted for photo access");
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _requestPermissions(); // Request permissions when the screen loads
//   }

//   int indexx = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           'New Post',
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: false,
//         actions: [
//           Center(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.w),
//               child: GestureDetector(
//                 onTap: () {
//                   if (_file != null) {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => AddPostTextScreen(_file!),
//                     ));
//                   }
//                 },
//                 child: Text(
//                   'Next',
//                   style: TextStyle(fontSize: 15.sp, color: Colors.blue),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // GridView for the main image preview
//             SizedBox(
//               height: 375.h,
//               child: GridView.builder(
//                 itemCount:
//                     _mediaList.length, // Use the length of the media list
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 1,
//                   mainAxisSpacing: 1,
//                   crossAxisSpacing: 1,
//                 ),
//                 itemBuilder: (context, index) {
//                   return _mediaList[index];
//                 },
//               ),
//             ),
//             // Recent media section
//             Container(
//               width: double.infinity,
//               height: 40.h,
//               color: Colors.white,
//               child: Row(
//                 children: [
//                   SizedBox(width: 10.w),
//                   Text(
//                     'Recent',
//                     style:
//                         TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
//                   ),
//                 ],
//               ),
//             ),
//             // GridView for recent images
//             GridView.builder(
//               shrinkWrap: true,
//               itemCount: _mediaList.length, // Use the length of the media list
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 mainAxisSpacing: 1,
//                 crossAxisSpacing: 2,
//               ),
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       indexx = index;
//                       _file = path[index]; // Set the selected file
//                     });
//                   },
//                   child: _mediaList[index],
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
