import 'dll.dart' ;
import 'package:post_2024/dependency_injection/depend_inject.dart' as di;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

