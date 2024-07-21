import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      final level = courseCode.substring(1, 3); // L1
      final semester = courseCode.substring(3, 5); // S1
      final courseName = courseCode.substring(5); // FLT

      var refStorage = FirebaseStorage.instance.ref().child(
          '/$level/$semester/$courseName/${filePath.split('/').last}');

      UploadTask uploadTask = refStorage.putFile(File(filePath));

      await uploadTask;

      final downloadUrl = await refStorage.getDownloadURL();
      return downloadUrl;
    } 
    catch (e) {
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
     

     DocumentReference ref = FirebaseFirestore.instance.collection('ITC-IUSR').doc();
      await ref.set(lecture.toMap());
    }  catch (e) {
      print('Error creating lecture: $e');
      throw e;
    }
   }

  
}
