import 'package:flutter/foundation.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

final logger = new Logger();

class Groupsdatabase
{
  static const groupsBox = '_groupBox';
  late final ValueListenable<Box<dynamic>> box = ValueNotifier(Hive.box(groupsBox));

  late final Box<dynamic> _box = box.value;

  Groupsdatabase()
  {
    //_box.value = Hive.box(groupsBox);
    logger.d(_box.path);
  }

  Future<T> getValue<T>(Object key, {T? defaultvalue}) async =>  await _box.get(key,defaultValue: defaultvalue,);
  Future<void> setValue<T>(Object key, T value) async => await _box.put(key,value);
  Future<void> deleteValue<T> (Object key) async => await _box.delete(key);
  Future<void> clearAll() async => await _box.clear();
  List<Group>? getGroups()  {
    logger.d (_box.values.toList().length);
    return _box.values.toList().cast<Group>();

  }
  Future<void> fillAll(List<Group> listPosts) async =>
      listPosts.forEach((element)  {
        _box.put(element.id, element);
        //logger.d('Puted ${element.lastName}');
      });

}