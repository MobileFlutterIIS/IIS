// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiSchedule.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class studentGroupAdapter extends TypeAdapter<studentGroup> {
  @override
  final int typeId = 5;

  @override
  studentGroup read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return studentGroup(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as int?,
      fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, studentGroup obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.specialityName)
      ..writeByte(1)
      ..write(obj.specialityCode)
      ..writeByte(2)
      ..write(obj.numberOfStudents)
      ..writeByte(3)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is studentGroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DateWeekAdapter extends TypeAdapter<DateWeek> {
  @override
  final int typeId = 6;

  @override
  DateWeek read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DateWeek(
      fields[0] as DateTime?,
      fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, DateWeek obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.weeknumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateWeekAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ScheduleDayAdapter extends TypeAdapter<ScheduleDay> {
  @override
  final int typeId = 4;

  @override
  ScheduleDay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduleDay(
      (fields[0] as List?)?.cast<int?>(),
      (fields[1] as List?)?.cast<studentGroup?>(),
      fields[2] as int?,
      (fields[3] as List?)?.cast<String?>(),
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      (fields[11] as List?)?.cast<Post?>(),
      fields[12] as String?,
      fields[13] as String?,
      fields[14] as String?,
      fields[15] as String?,
      fields[16] as bool?,
      fields[17] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ScheduleDay obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.weekNumber)
      ..writeByte(1)
      ..write(obj.studentGroups)
      ..writeByte(2)
      ..write(obj.numSubgroup)
      ..writeByte(3)
      ..write(obj.auditories)
      ..writeByte(4)
      ..write(obj.startLessonTime)
      ..writeByte(5)
      ..write(obj.endLessonTime)
      ..writeByte(6)
      ..write(obj.subject)
      ..writeByte(7)
      ..write(obj.subjectFullName)
      ..writeByte(8)
      ..write(obj.note)
      ..writeByte(9)
      ..write(obj.lessonTypeAbbrev)
      ..writeByte(10)
      ..write(obj.dateLesson)
      ..writeByte(11)
      ..write(obj.employees)
      ..writeByte(12)
      ..write(obj.startLessonDate)
      ..writeByte(13)
      ..write(obj.endLessonDate)
      ..writeByte(14)
      ..write(obj.announcementStart)
      ..writeByte(15)
      ..write(obj.announcementEnd)
      ..writeByte(16)
      ..write(obj.announcement)
      ..writeByte(17)
      ..write(obj.split);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleDayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ScheduleWeekAdapter extends TypeAdapter<ScheduleWeek> {
  @override
  final int typeId = 3;

  @override
  ScheduleWeek read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduleWeek(
      (fields[0] as List?)?.cast<ScheduleDay?>(),
      (fields[1] as List?)?.cast<ScheduleDay?>(),
      (fields[2] as List?)?.cast<ScheduleDay?>(),
      (fields[3] as List?)?.cast<ScheduleDay?>(),
      (fields[4] as List?)?.cast<ScheduleDay?>(),
      (fields[5] as List?)?.cast<ScheduleDay?>(),
    );
  }

  @override
  void write(BinaryWriter writer, ScheduleWeek obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.Monday)
      ..writeByte(1)
      ..write(obj.Tuesday)
      ..writeByte(2)
      ..write(obj.Wednesday)
      ..writeByte(3)
      ..write(obj.Thursday)
      ..writeByte(4)
      ..write(obj.Friday)
      ..writeByte(5)
      ..write(obj.Saturday);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleWeekAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ScheduleInfoAdapter extends TypeAdapter<ScheduleInfo> {
  @override
  final int typeId = 2;

  @override
  ScheduleInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduleInfo(
      fields[0] as Post?,
      fields[1] as Group?,
      fields[2] as ScheduleWeek?,
      (fields[3] as List?)?.cast<ScheduleDay?>(),
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ScheduleInfo obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.employeeDto)
      ..writeByte(1)
      ..write(obj.studentGroupDto)
      ..writeByte(2)
      ..write(obj.schedules)
      ..writeByte(3)
      ..write(obj.exams)
      ..writeByte(4)
      ..write(obj.startDate)
      ..writeByte(5)
      ..write(obj.endDate)
      ..writeByte(6)
      ..write(obj.startExamsDate)
      ..writeByte(7)
      ..write(obj.endExamsDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

studentGroup _$studentGroupFromJson(Map<String, dynamic> json) => studentGroup(
      json['specialityName'] as String?,
      json['specialityCode'] as String?,
      json['numberOfStudents'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$studentGroupToJson(studentGroup instance) =>
    <String, dynamic>{
      'specialityName': instance.specialityName,
      'specialityCode': instance.specialityCode,
      'numberOfStudents': instance.numberOfStudents,
      'name': instance.name,
    };

ScheduleDay _$ScheduleDayFromJson(Map<String, dynamic> json) => ScheduleDay(
      (json['weekNumber'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['studentGroups'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : studentGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['numSubgroup'] as int?,
      (json['auditories'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      json['startLessonTime'] as String?,
      json['endLessonTime'] as String?,
      json['subject'] as String?,
      json['subjectFullName'] as String?,
      json['note'] as String?,
      json['lessonTypeAbbrev'] as String?,
      json['dateLesson'] as String?,
      (json['employees'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['startLessonDate'] as String?,
      json['endLessonDate'] as String?,
      json['announcementStart'] as String?,
      json['announcementEnd'] as String?,
      json['announcement'] as bool?,
      json['split'] as bool?,
    );

Map<String, dynamic> _$ScheduleDayToJson(ScheduleDay instance) =>
    <String, dynamic>{
      'weekNumber': instance.weekNumber,
      'studentGroups': instance.studentGroups,
      'numSubgroup': instance.numSubgroup,
      'auditories': instance.auditories,
      'startLessonTime': instance.startLessonTime,
      'endLessonTime': instance.endLessonTime,
      'subject': instance.subject,
      'subjectFullName': instance.subjectFullName,
      'note': instance.note,
      'lessonTypeAbbrev': instance.lessonTypeAbbrev,
      'dateLesson': instance.dateLesson,
      'employees': instance.employees,
      'startLessonDate': instance.startLessonDate,
      'endLessonDate': instance.endLessonDate,
      'announcementStart': instance.announcementStart,
      'announcementEnd': instance.announcementEnd,
      'announcement': instance.announcement,
      'split': instance.split,
    };

ScheduleWeek _$ScheduleWeekFromJson(Map<String, dynamic> json) => ScheduleWeek(
      (json['Понедельник'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ScheduleDay.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Вторник'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ScheduleDay.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Среда'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ScheduleDay.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Четверг'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ScheduleDay.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Пятница'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ScheduleDay.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Суббота'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ScheduleDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScheduleWeekToJson(ScheduleWeek instance) =>
    <String, dynamic>{
      'Понедельник': instance.Monday,
      'Вторник': instance.Tuesday,
      'Среда': instance.Wednesday,
      'Четверг': instance.Thursday,
      'Пятница': instance.Friday,
      'Суббота': instance.Saturday,
    };

ScheduleInfo _$ScheduleInfoFromJson(Map<String, dynamic> json) => ScheduleInfo(
      json['employeeDto'] == null
          ? null
          : Post.fromJson(json['employeeDto'] as Map<String, dynamic>),
      json['studentGroupDto'] == null
          ? null
          : Group.fromJson(json['studentGroupDto'] as Map<String, dynamic>),
      json['schedules'] == null
          ? null
          : ScheduleWeek.fromJson(json['schedules'] as Map<String, dynamic>),
      (json['exams'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ScheduleDay.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['startDate'] as String?,
      json['endDate'] as String?,
      json['startExamsDate'] as String?,
      json['endExamsDate'] as String?,
    );

Map<String, dynamic> _$ScheduleInfoToJson(ScheduleInfo instance) =>
    <String, dynamic>{
      'employeeDto': instance.employeeDto,
      'studentGroupDto': instance.studentGroupDto,
      'schedules': instance.schedules,
      'exams': instance.exams,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'startExamsDate': instance.startExamsDate,
      'endExamsDate': instance.endExamsDate,
    };
