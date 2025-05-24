import 'package:flutter/material.dart';
import 'package:schedule_me/Helpers/NetworkConnections/_GetImageUrlFromJson.dart';

class ImageNetworkParser extends StatelessWidget {
  final Map? clientInfo;

  const ImageNetworkParser({super.key, this.clientInfo});

  @override
  Widget build(BuildContext context) {
    if (clientInfo != null) {
      return CircleAvatar(
        backgroundColor: Colors.white,
        child: ClipOval(
          child: Image.network(
            "http://185.194.126.86/RAS/" +
                clientInfo!["data"]["EXTRA"]["PICTURE"].toString().trim(),

            errorBuilder: (context, error, stackTrace) => Icon(Icons.person),
          ),
        ),
      );
    } else {
      return Text("error in loading the image");
    }
  }
}
