import 'package:flutter/material.dart';

class VidScreen extends StatelessWidget {
  const VidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        actions: [
          // SizedBox(
          //   width: 20,
          // ),
          // Icon(Icons.share),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.settings),
          SizedBox(
            width: 20,
          ),
        ],
        title: Text('ICS-3328D'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assest/images/cam.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
              color: Colors.grey.shade300,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.pause_circle_sharp),
                    Icon(Icons.stop_circle),
                    Icon(Icons.hd),
                    Icon(Icons.volume_off_outlined),
                    Icon(Icons.screen_rotation_alt),
                  ]),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 30, left: 40, right: 40, bottom: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttontexticon(context, Icons.camera_enhance, "Snapshot"),
                    buttontexticon(
                        context, Icons.video_camera_back_outlined, "Record"),
                    buttontexticon(context, Icons.shield_outlined, "Service"),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buttontexticon(context, iconname, textname) {
  return Column(
    children: [
      Icon(
        iconname,
        size: 35,
      ),
      SizedBox(
        height: 10,
      ),
      Text(textname)
    ],
  );
}
