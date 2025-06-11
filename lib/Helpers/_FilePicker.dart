import 'dart:io';

import 'package:file_picker/file_picker.dart';

Future<File?> pickafile()async{
FilePickerResult? result = await FilePicker.platform.pickFiles();

if (result != null) {
return File(result.files.single.path!);
} else {
  // User canceled the picker

}
  
}