import 'dart:io';
import 'dart:typed_data';

import 'package:demo_flutter_testing/Camera/showImage.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class GridGallery1 extends StatefulWidget {
  final ScrollController? scrollCtr;

  const GridGallery1({
    Key? key,
    this.scrollCtr,
  }) : super(key: key);

  @override
  _GridGallery1State createState() => _GridGallery1State();
}

class _GridGallery1State extends State<GridGallery1> {
  List<Widget> _mediaList = [];
  int currentPage = 0;
  int? lastPage;

  @override
  void initState() {
    super.initState();
    _fetchNewMedia();
  }

  _handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        _fetchNewMedia();
      }
    }
  }

  Future<String?> _getImagePath(AssetEntity asset) async {
    final file = await asset.file;
    return file?.path;
  }

  _fetchNewMedia() async {
    lastPage = currentPage;
    final PermissionState _ps = await PhotoManager.requestPermissionExtend();
    if (_ps.isAuth) {
      List<AssetPathEntity> albums =
      await PhotoManager.getAssetPathList(onlyAll: true);
      print("album $albums");
      List<AssetEntity> media =
      await albums[0].getAssetListPaged(size: 60, page: currentPage);
      print("media $media");
      List<Widget> temp = [];
      for (var index = 0; index < media.length; index++) {
        final asset = media[index];
        final thumbnailData = await asset.thumbnailDataWithSize(const ThumbnailSize(200, 200));
        final imagePath = await _getImagePath(asset);
        temp.add(
          GestureDetector(
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.memory(thumbnailData!, fit: BoxFit.fill),
                ),
                if (asset.type == AssetType.video)
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 5, bottom: 5),
                      child: Icon(
                        Icons.videocam,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            onTap: () {
              // _showImagePathDialog(imagePath);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowImage(image:imagePath.toString())));
            },
          ),
        );
      }
      setState(() {
        _mediaList.addAll(temp);
        currentPage++;
      });
    } else {
      // Handle permission denied
      // You can call PhotoManager.openSetting(); to open the application's settings for permission.
    }
  }


  void _showImagePathDialog(String? imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Image Path"),
          content: Text(imagePath ?? "Image path not available"),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scroll) {
        _handleScrollEvent(scroll);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text("All Gallery Photo")),
          body: GridView.builder(
            controller: widget.scrollCtr,
            itemCount: _mediaList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
              childAspectRatio: 1 / 1,
            ),
            itemBuilder: (BuildContext context, int index) {
              return _mediaList[index];
            },
          ),
        ),
      ),
    );
  }
}
