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
      'title': title,
      'lectureNumber': lectureNumber,
      'courseCode': courseCode,
      'filePath': filePath,
    };
  }
}
