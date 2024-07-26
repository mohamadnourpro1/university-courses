import 'package:flutter/material.dart';
import 'package:university_courses/src/models/send_data_base/upload_lecture.dart';

class LsitviewBodyWidget extends StatefulWidget {
  const LsitviewBodyWidget({Key? key}) : super(key: key);

  @override
  _LsitviewBodyWidgetState createState() => _LsitviewBodyWidgetState();
}

class _LsitviewBodyWidgetState extends State<LsitviewBodyWidget> {
  List<LectureData> _lectures = [];
  bool _isLoading = true;
  late String _levelWiew;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Retrieve the course code from the route arguments
    final args = ModalRoute.of(context)?.settings.arguments as String?;
    if (args != null) {
      _levelWiew = args;
      _loadLectures();
    } else {
      // Handle the case where arguments are missing
      print('No course code provided');
    }
  }

  Future<void> _loadLectures() async {
    try {
      await LectureData.getALLlectureData(_levelWiew)
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
                    onTap: () async {
                      Navigator.of(context).pushNamed('Login/Level/ViewLevel/ViewPdf/');
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
                              Icons.download,
                              color: theme.colorScheme.secondary,
                              size: 25,
                            ),
                            onTap: () {
                              print("تحميل الملف ${lecture.filePath}");
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
