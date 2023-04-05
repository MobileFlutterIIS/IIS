import 'package:iis/services/ScheduleAndListFromNet/Api.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class Tutorsdatabase
{
  static const tutorsBox = '_tutorsBox';

  late final Box<dynamic> _box;

  Tutorsdatabase()
  {
    _box = Hive.box(tutorsBox);
    logger.d(_box.path);
  }

  Future<T> getValue<T>(Object key, {T? defaultvalue}) async =>  await _box.get(key,defaultValue: defaultvalue,);
  Future<void> setValue<T>(Object key, T value) async => await _box.put(key,value);
  Future<void> deleteValue<T> (Object key) async => await _box.delete(key);
  Future<void> clearAll() async => await _box.clear();
  List<Post>? getPosts()  {
    logger.d (_box.values.toList().length);
    return _box.values.toList().cast<Post>();

  }
  Future<void> fillAll(List<Post> listPosts) async =>
     listPosts.forEach((element)  {
        _box.put(element.id, element);
       //logger.d('Puted ${element.lastName}');
     });

}