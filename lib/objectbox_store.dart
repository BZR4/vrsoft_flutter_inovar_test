import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vrsoft_flutter_inovar_test/objectbox.g.dart';
import 'package:path/path.dart' as p;

class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store) {}

  static Future<ObjectBox> create() async {
    final docDir = await getApplicationDocumentsDirectory();
    final store =
        await openStore(directory: p.join(docDir.path, 'obx-example'));

    return ObjectBox._create(store);
  }
}

// class ObjectBox {
//   late final Store store;

//   ObjectBox._create(this.store) {}

//   static Future<ObjectBox> create() async {
//     final docDir = await getApplicationDocumentsDirectory();
//     final store =
//         await openStore(directory: p.join(docDir.path, 'obx-example'));

//     return ObjectBox._create(store);
//   }
// }

