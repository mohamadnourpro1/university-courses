import 'package:university_courses/src/models/send_data_base/lecture_data%20.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
class FirebaseUploader {
  Future<void> uploadLectureToFirebase(LectureData lectureData) async {
    // Parse course code
    final level = lectureData.courseCode.substring(1, 3); // L1
    final semester = lectureData.courseCode.substring(3, 5); // S1
    final courseName = lectureData.courseCode.substring(5); // FLT

    var refStorage = FirebaseStorage.instance
        .ref()
        .child('/$level/$semester/$courseName/${lectureData.filePath.split('/').last}');
    UploadTask uploadTask = refStorage.putFile(File(lectureData.filePath));
    await uploadTask;

    // Save data to Firestore
    await FirebaseFirestore.instance.collection('/ITC').add(lectureData.toMap());
    
  }
}
