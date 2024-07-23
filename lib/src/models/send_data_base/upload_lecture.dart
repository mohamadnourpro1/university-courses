import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';

class LectureData {
  String title;
  int lectureNumber;
  String courseCode;
  String filePath;

  LectureData({
    required this.title,
    required this.lectureNumber,
    required this.courseCode,
    required this.filePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'lecturetitle': title,
      'lectureNumber': lectureNumber,
      'courseCode': courseCode,
      'filePath': filePath,
    };
  }

  Future<String> _uploadToFirebase() async {
    try {
      final level = courseCode.substring(0, 1); // 1
      final semester = courseCode.substring(1, 2); // 2
      final courseName = courseCode.substring(2); // FL

      var refStorage = FirebaseStorage.instance.ref().child(
          '/$level/$semester/$courseName/${filePath.split('/').last}');

      UploadTask uploadTask = refStorage.putFile(File(filePath));

      await uploadTask;

      final downloadUrl = await refStorage.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading lecture: $e');
      throw e;
    }
  }

  Future<void> createLecture() async {
    try {
      final downloadUrl = await _uploadToFirebase();

      LectureData lecture = LectureData(
        title: title,
        lectureNumber: lectureNumber,
        courseCode: courseCode,
        filePath: downloadUrl,
      );

      print("....................................................................................................");
      print("Title: $title");
      print("Lecture Number: $lectureNumber");
      print("Course Code: $courseCode");
      print("File Path: $filePath");
      print("....................................................................................................");

      var url = Uri.parse('http://192.168.1.110:8000/api/auth/file');

      var response = await http.post(url, body: {
        'title': lecture.title,
        'lecture_number': lecture.lectureNumber.toString(),
        'course_code': lecture.courseCode,
        'file_path': lecture.filePath,
      });

      if (response.statusCode == 200) {
        print('Lecture data sent successfully');
      } else {
        print('Failed to send lecture data: ${response.body}');
      }
    } catch (e) {
      print('Error creating lecture: $e');
      throw e;
    }
  }
}
