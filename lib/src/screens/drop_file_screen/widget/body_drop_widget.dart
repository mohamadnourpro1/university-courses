import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:university_courses/src/widgets/text_field.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class BodyDropWidget extends StatefulWidget {
  @override
  _BodyDropWidgetState createState() => _BodyDropWidgetState();
}

class _BodyDropWidgetState extends State<BodyDropWidget> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _lectureNumberController = TextEditingController();
  final TextEditingController _courseCodeController = TextEditingController();
  String? _filePath;
  String? _fileName;

  void _clearFields() {
    setState(() {
      _titleController.clear();
      _lectureNumberController.clear();
      _courseCodeController.clear();
      _filePath = null;
      _fileName = null;
    });
  }

  Future<void> _uploadLectureData(BuildContext context) async {
    String title = _titleController.text;
    String lectureNumber = _lectureNumberController.text;
    String courseCode = _courseCodeController.text;

    if (title.isEmpty || lectureNumber.isEmpty || courseCode.isEmpty || _filePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('الرجاء إدخال عنوان، رقم المحاضرة، رمز المادة وتحميل ملف PDF'),
        backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final snackBar = SnackBar(        backgroundColor: Colors.grey,

      content: Text('جاري تحميل المحاضرة...'),
      duration: Duration(days: 1), // Make it long-lasting
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    try {
      var refStorage = FirebaseStorage.instance.ref().child('/LEVEL3/${_fileName!}');
      UploadTask uploadTask = refStorage.putFile(File(_filePath!));  await uploadTask;
      
  
    

      ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Hide the loading snackbar

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(        backgroundColor: Colors.green,

          content: Text('تم إرسال البيانات بنجاح'),
        ),
      );

      _clearFields();
    } catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Hide the loading snackbar

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(        backgroundColor: Colors.red,

          content: Text('حدث خطأ أثناء رفع الملف'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: theme.colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 52,
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "رفع محاضرة",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  MyTextField(
                    controller: _courseCodeController,
                    labelText: "رمز المادة",
                    hintText: "#LYSN",
                  ),
                  SizedBox(height: 20),
                  MyTextField(
                    controller: _lectureNumberController,
                    labelText: "رقم المحاضرة",
                  ),
                  SizedBox(height: 20),
                  MyTextField(
                    controller: _titleController,
                    labelText: "عنوان المحاضرة",
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );

                      if (result != null) {
                        setState(() {
                          _filePath = result.files.single.path;
                          _fileName = result.files.single.name;
                        });
                      }
                    },
                    child: Text('تحميل الملف'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: Colors.white,
                      minimumSize: Size(150, 40),
                    ),
                  ),
                  SizedBox(height: 20),
                  _fileName != null
                      ? ListTile(
                          title: Text(
                            '$_fileName تم تحديد الملف ',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      : Container(),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => _uploadLectureData(context),
                    child: Text('ارسال الملف'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: Colors.white,
                      minimumSize: Size(200, 50),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
