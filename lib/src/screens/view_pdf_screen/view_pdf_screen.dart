import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:university_courses/src/widgets/BottomNavigationBarWidget.dart';
import 'package:university_courses/src/widgets/EndDrawerWidget.dart';

class ViewPdfScreen extends StatefulWidget {
  const ViewPdfScreen({Key? key}) : super(key: key);

  @override
  _ViewPdfScreenState createState() => _ViewPdfScreenState();
}

class _ViewPdfScreenState extends State<ViewPdfScreen> {
  Uint8List? _documentBytes;
  
  final String _filePath = 'nhttps://firebasestorage.googleapis.com/v0/b/iusr-courses.appspot.com/o/5%2F4%2FGJ%2F%D8%A8%D8%B1%D9%86%D8%A7%D9%85%D8%AC%20%D8%A7%D9%84%D8%A7%D9%85%D8%AA%D8%AD%D8%A7%D9%86.pdf?alt=media&token=5ef7c204-6669-4a27-92f0-c9c16cd08b69f'; // مسار الملف في Firebase Storage

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      // الحصول على مرجع ملف PDF من Firebase Storage
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref(_filePath);
      
      // تحميل البيانات من Firebase Storage
      final Uint8List? data = await ref.getData(104857600); // الحجم الأقصى للبيانات التي تريد تحميلها (100 ميجابايت في هذا المثال)

      if (data != null) {
        setState(() {
          _documentBytes = data;
        });
      } else {
        throw Exception('Failed to load PDF');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('View PDF')),
      body: _documentBytes == null
          ? const Center(child: CircularProgressIndicator())
          : SfPdfViewer.memory(_documentBytes!),
      endDrawer: MyEndDrawer(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
