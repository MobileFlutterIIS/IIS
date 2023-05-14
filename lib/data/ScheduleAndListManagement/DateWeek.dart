import 'package:iis/services/ScheduleAndListFromNet/Api.dart';
import 'package:iis/services/ScheduleAndListFromNet/ApiSchedule.dart';
import 'package:logger/logger.dart';
import 'package:hive/hive.dart';

final logger = new Logger();

class DataDataBase
{
  static const dateBox = '_dateBox';

  late final Box<dynamic> _box;

  DataDataBase()
  {
    _box = Hive.box(dateBox);
    logger.d(_box.path);
  }

  Future<T> getValue<T>(Object key, {T? defaultvalue}) async =>  await _box.get(key,defaultValue: defaultvalue,);
  Future<void> setValue<T>(Object key, T value) async => await _box.put(key,value);
  Future<void> deleteValue<T> (Object key) async => await _box.delete(key);
  Future<void> addValue<T>(Object key, T value) async {
    if (_box.containsKey(key)){ await _box.delete(key);}
    await _box.put(key,value);
    await _box.compact();
  }
  Future<void> clearAll() async => await _box.clear();
  List<ScheduleInfo>? getSchedules()  {
    logger.d (_box.values.toList().length);
    return _box.values.toList().cast<ScheduleInfo>();
  }
  Future<void> fillAll(List<Post> listPosts) async =>
      listPosts.forEach((element)  {
        _box.put(element.id, element);
        //logger.d('Puted ${element.lastName}');
      });

}