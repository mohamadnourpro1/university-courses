import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:university_courses/src/models/send_data_base/upload_lecture.dart'; 

class LsitviewBodyWidget extends StatefulWidget {
  const LsitviewBodyWidget({Key? key}) : super(key: key);

  @override
  _ListviewBodyWidgetState createState() => _ListviewBodyWidgetState();
}

class _ListviewBodyWidgetState extends State<LsitviewBodyWidget> {
  List<LectureData> _lectures = [];
  bool _isLoading = true;
  late String _levelView; 

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Retrieve the course code from the route arguments
    final args = ModalRoute.of(context)?.settings.arguments as String?;
    if (args != null) {
      _levelView = args; 
      _loadLectures();
    } else {
      // Handle the case where arguments are missing
      print('No course code provided');
    }
  }

  Future<void> _loadLectures() async {
    try {
      await LectureData.getALLlectureData(_levelView) 
          .then((lectures) {
        setState(() {
          _lectures = lectures;
          _isLoading = false;
        });
      });
    } catch (e) {
      print('حدث خطأ أثناء جلب بيانات المحاضرات: $e');
    }
  }

  void _showLectureDialog(String title, String filePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('افتح الرابط في متصفح للحصول على الملف'),
              Row(
                children: [
                  Icon(Icons.warning, color: Colors.red, size: 20),
                  SizedBox(width: 4),
                  Text("vpn انتبه اذا كنت تحب ياسمين الدمشقي يجب ان تشغل ^_^ ", style: TextStyle(fontSize: 16, color: Colors.red)),
                ],
              ),
            ],
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
           
          ),
          actions: <Widget>[
            TextButton(
              child: Text('نسخ الرابط', style: TextStyle(color: Colors.green)),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: filePath)).then((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('تم نسخ الرابط إلى الحافظة'),
                    ),
                  );
                });
              },
            ),
            TextButton(
              child: Text('إغلاق', style: TextStyle(color: Colors.red)),
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
    final theme = Theme.of(context);

    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _lectures.length,
              itemBuilder: (BuildContext context, int index) {
                final lecture = _lectures[index];

                return Card(
                  color: theme.colorScheme.primary,
                  child: InkWell(
                    onTap: () {
                      _showLectureDialog(lecture.title, lecture.filePath);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: theme.colorScheme.secondary,
                            radius: 25,
                            child: Text(
                              "${index + 1}",
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "${lecture.title}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          InkWell(
                            child: Icon(
                              Icons.copy,
                              color: theme.colorScheme.secondary,
                              size: 25,
                            ),
                            onTap: () {
                              print("عرض التفاصيل ${lecture.filePath}");
                              _showLectureDialog(lecture.title, lecture.filePath);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
