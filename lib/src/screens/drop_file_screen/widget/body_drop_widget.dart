import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:university_courses/src/models/send_data_base/lecture_data%20.dart';
import 'package:university_courses/src/widgets/text_field.dart';

import 'package:university_courses/src/models/send_data_base/firebase_uploader.dart';

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

  @override
  void initState() {
    super.initState();
    _courseCodeController.addListener(() {
      _courseCodeController.value = _courseCodeController.value.copyWith(
        text: _courseCodeController.text.toUpperCase(),
        selection: _courseCodeController.selection,
      );
    });
  }

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
    String lectureNumberStr = _lectureNumberController.text;
    String courseCode = _courseCodeController.text.toUpperCase();

    if (title.isEmpty || lectureNumberStr.isEmpty || courseCode.isEmpty || _filePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('الرجاء إدخال عنوان، رقم المحاضرة، رمز المادة وتحميل ملف PDF'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    int? lectureNumber = int.tryParse(lectureNumberStr);
    if (lectureNumber == null || lectureNumber < 1 || lectureNumber > 20) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('رقم المحاضرة يجب أن يكون بين 1 و 20'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (courseCode.isEmpty || courseCode[0] != '#') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('رمز المادة يجب أن يبدأ بـ #'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (courseCode.length != 7) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('رمز المادة يجب أن يتكون من 6 أحرف'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (title.length > 50) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('عنوان المحاضرة يجب ألا يتجاوز 50 حرفًا'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final snackBar = SnackBar(
      backgroundColor: Colors.grey,
      content: Text('جاري تحميل المحاضرة...'),
      duration: Duration(days: 1),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    try {
      final lectureData = LectureData(
        title: title,
        lectureNumber: lectureNumber,
        courseCode: courseCode,
        filePath: _filePath!,
      );

      await uploadLectureToFirebase(lectureData);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text('تم إرسال البيانات بنجاح'),
        ),
      );

      _clearFields();
    } catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('حدث خطأ أثناء رفع الملف'),
        ),
      );
    }
  }

  Future<void> uploadLectureToFirebase(LectureData lectureData) async {
    final uploader = FirebaseUploader();
    await uploader.uploadLectureToFirebase(lectureData);
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
                    hintText: "#L1S1FLT",
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
