import 'package:post_2024/dependency_injection/package_export.dart';
import 'package:post_2024/posts/data/data_source/local/post_local_impl_shared_pref.dart';

import 'dll.dart' ;
import 'package:post_2024/dependency_injection/depend_inject.dart' as di;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
}

