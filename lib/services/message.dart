import 'package:myVault/models/category.dart';
import 'package:myVault/models/message.dart';

class MessageService {
  static final MessageService _singleton = MessageService._internal();
  MessageService._internal();

  factory MessageService() {
    return _singleton;
  }

  Future<List<Category>> getCategories() async {
    return [Category('OTPs'), Category('Banks'), Category('Family')];
  }

  Future<List<Message>> getMessages(Category category) async {
    return [Message('Melvin'), Message('Davis'), Message('Amma')];
  }
}
