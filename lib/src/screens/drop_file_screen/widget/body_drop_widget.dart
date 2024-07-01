import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class BodyDropWidget extends StatefulWidget {
  @override
  _BodyDropWidgetState createState() => _BodyDropWidgetState();
}

class _BodyDropWidgetState extends State<BodyDropWidget> {
  final TextEditingController _titleController = TextEditingController();
  String? _filePath;
  String? _fileName;

  void _sendData(BuildContext context) {
    String title = _titleController.text;
    if (title.isEmpty || _filePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('الرجاء إدخال عنوان وتحميل ملف PDF')),
      );
      return;
    }
    
    print('العنوان: $title');
    print('اسم الملف: $_fileName');
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم إرسال البيانات بنجاح')),
    );
    
    setState(() {
      _titleController.clear();
      _filePath = null;
      _fileName = null;
    });
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
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: "عنوان المحاضرة",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 14),
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
                    } else {
                      // User canceled the picker
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
                  onPressed: () => _sendData(context),
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
    );
  }
}
