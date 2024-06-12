import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  MultiProvider(
    providers: [
      Provider(create: (_) => ()),
    ],
  ),
];




