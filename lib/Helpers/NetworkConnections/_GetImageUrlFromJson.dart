Future<String?> getImageUrlFromJson(json) async {
  //if the user entered as a guest
  if (json==null||json["success"]==false) {
    return null;
  }
  
    return json["data"]["EXTRA"]["PICTURE"];
}
