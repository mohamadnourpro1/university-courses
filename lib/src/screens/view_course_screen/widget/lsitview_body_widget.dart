import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';


class LsitviewBodyWidget extends StatefulWidget {
  const LsitviewBodyWidget({Key? key}) : super(key: key);

  @override
  _LsitviewBodyWidgetState createState() => _LsitviewBodyWidgetState();
}

class _LsitviewBodyWidgetState extends State<LsitviewBodyWidget> {
  late ListResult _listResult;
  bool _isLoading = true; // حالة لإظهار دائرة التحميل

  @override
  void initState() {
    super.initState();
    _loadFiles();
  }

  Future<void> _loadFiles() async {
    try {
      // استرجاع قائمة الملفات من Firebase Storage وانتظار حتى الانتهاء
      _listResult = await FirebaseStorage.instance.ref().child('L1/S1/MT').listAll();
      setState(() {
        _isLoading = false; // إيقاف عرض دائرة التحميل بمجرد استرداد البيانات
      });
    } catch (e) {
      print('حدث خطأ أثناء جلب البيانات: $e');
      // يمكنك إضافة معالجة للأخطاء هنا
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // استخدام مظهر التطبيق الحالي

    return Scaffold(
      
      body: _isLoading
          ? Center(child: CircularProgressIndicator()) // عرض دائرة التحميل أثناء الانتظار
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _listResult.items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = _listResult.items[index];

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
                                "${item.name} ",
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
                              print("تحميل الملف ${item.name}");
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
