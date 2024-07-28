import 'dart:convert';
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

  factory LectureData.fromJson(Map<String, dynamic> json) {
    return LectureData(
      title: json['title'] ?? 'غير متوفر',
      lectureNumber: json['lecture_number'] ?? 0,
      courseCode: json['course_code'] ?? 'غير متوفر',
      filePath: json['file_path'] ?? 'غير متوفر',
    );
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

      var url = Uri.parse('http://192.168.3.4:8000/api/auth/file');
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'title': lecture.title,
          'lecture_number': lecture.lectureNumber.toString(),
          'course_code': lecture.courseCode,
          'file_path': lecture.filePath,
        },
      );

      if (response.statusCode == 200) {
        print('Lecture data sent successfully');
        await getALLlectureData('http://192.168.3.4:8000/api/auth/file');
      } else {
        print('Failed to send lecture data: ${response.body}');
      }
    } catch (e) {
      print('Error creating lecture: $e');
      throw e;
    }
  }
static Future<List<LectureData>> getALLlectureData(String url) async {
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse is Map<String, dynamic>) {
        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List<dynamic>) {
          final jsonData = jsonResponse['data'] as List<dynamic>;

          List<LectureData> lectures = [];
          for (var item in jsonData) {
            if (item is Map<String, dynamic>) {
              try {
                lectures.add(LectureData.fromJson(item));
              } catch (e) {
                print('Error parsing lecture data: $e');
              }
            } else {
              print('Unexpected item type: ${item.runtimeType}');
            }
            
            for (var lecture in lectures) {
              print("....................................................................................................");
              print("العنوان: ${lecture.title}");
              print("رقم المحاضرة: ${lecture.lectureNumber}");
              print("رمز الدورة: ${lecture.courseCode}");
              print("مسار الملف: ${lecture.filePath}");
              print("....................................................................................................");
            }
          }

          return lectures;
        } else {
          print("الاستجابة لا تحتوي على قائمة تحت المفتاح 'data'.");
          return [];
        }
      } else {
        print("الاستجابة ليست خريطة.");
        return [];
      }
    } else {
      print("فشل في جلب المحاضرات. حالة الاستجابة: ${response.statusCode}");
      return [];
    }
  } catch (e) {
    print('خطأ في جلب بيانات المحاضرات: $e');
    return [];
  }
}








static Future<LectureData?> getLectureData() async {
  try {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/auth/showfile?course_code=fl'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse is Map<String, dynamic>) {
        if (jsonResponse.containsKey('data') && jsonResponse['data'] is Map<String, dynamic>) {
          final jsonData = jsonResponse['data'] as Map<String, dynamic>;

          try {
            LectureData lecture = LectureData.fromJson(jsonData);
            print("....................................................................................................");
            print("العنوان: ${lecture.title}");
            print("رقم المحاضرة: ${lecture.lectureNumber}");
            print("رمز الدورة: ${lecture.courseCode}");
            print("مسار الملف: ${lecture.filePath}");
            print("....................................................................................................");

            return lecture;
          } catch (e) {
            print('Error parsing lecture data: $e');
            return null;
          }
        } else {
          print("الاستجابة لا تحتوي على بيانات تحت المفتاح 'data' أو البيانات ليست خريطة.");
          return null;
        }
      } else {
        print("الاستجابة ليست خريطة.");
        return null;
      }
    } else {
      print("فشل في جلب بيانات المحاضرة. حالة الاستجابة: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    print('خطأ في جلب بيانات المحاضرة: $e');
    return null;
  }
}

}













