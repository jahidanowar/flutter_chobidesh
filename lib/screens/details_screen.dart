import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

class DetailsScreen extends StatefulWidget {
  final String imagePath;
  DetailsScreen({@required this.imagePath});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String _wallpaperFile = "Set Wallpaper";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.imagePath), fit: BoxFit.cover),
        ),
        child: Center(
          child: RaisedButton(
            color: Colors.black45,
            textColor: Colors.white,
            onPressed: setWallpaperFromFile,
            child: Text(
              _wallpaperFile,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> setWallpaperFromFile() async {
    setState(() {
      _wallpaperFile = "Setting Wallpaper";
    });
    String result;
    var file = await DefaultCacheManager().getSingleFile(widget.imagePath);
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await WallpaperManager.setWallpaperFromFile(
          file.path, WallpaperManager.HOME_SCREEN);
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() {
      _wallpaperFile = result;
    });
  }
}
