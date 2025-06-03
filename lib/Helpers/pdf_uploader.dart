import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schedule_me/Class/Lecture.dart';
import 'package:schedule_me/pdf_parser.dart';

class PdfUploader extends StatefulWidget {
  final Function(List<Lecture>) onPdfParsed;

  const PdfUploader({Key? key, required this.onPdfParsed}) : super(key: key);

  @override
  _PdfUploaderState createState() => _PdfUploaderState();
}

class _PdfUploaderState extends State<PdfUploader> {
  bool _isLoading = false;
  String? _fileName;

  Future<void> _pickAndParsePdf() async {
    setState(() => _isLoading = true);
    
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false,
      );

      if (result != null) {
        _fileName = result.files.single.name;
        final filePath = result.files.single.path!;
        
        final Schedule schedule = await PdfParser.parsePdfContent(filePath);
        var lectures=schedule.lectures;
        if (lectures.isNotEmpty) {
          widget.onPdfParsed(lectures);
          Fluttertoast.showToast(
            msg: "تم تحميل ${lectures.length} محاضرة بنجاح",
            toastLength: Toast.LENGTH_LONG,
          );
        } else {
          throw Exception("No lectures found in PDF");
        }
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "خطأ في تحميل الملف: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.red,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          icon: _isLoading 
              ? CircularProgressIndicator(color: Colors.white)
              : Icon(Icons.upload_file),
          label: Text(_fileName ?? "اختر ملف الجدول الدراسي"),
          onPressed: _isLoading ? null : _pickAndParsePdf,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        )),
        if (_fileName != null) 
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              "الملف المحدد: $_fileName",
              style: TextStyle(color: Colors.grey),
            ),
          ),
      ],
    );
  }
}