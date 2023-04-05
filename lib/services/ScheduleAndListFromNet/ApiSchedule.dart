import "package:json_annotation/json_annotation.dart";
import 'package:hive/hive.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';

part 'ApiSchedule.g.dart';

@JsonSerializable()
@HiveType(typeId: 5)
class studentGroup
{
  @HiveField(0)
  String? specialityName;
  @HiveField(1)
  String? specialityCode;
  @HiveField(2)
  int? numberOfStudents;
  @HiveField(3)
  String? name;

  studentGroup(this.specialityName, this.specialityCode, this.numberOfStudents,
      this.name);

  factory studentGroup.fromJson(Map<String, dynamic> json) => _$studentGroupFromJson(json);
  Map<String, dynamic> toJson() => _$studentGroupToJson(this);

}

@JsonSerializable()
@HiveType(typeId: 4)
class ScheduleDay
{
  @HiveField(0)
  List<int?>? weekNumber;
  @HiveField(1)
  List<studentGroup?>? studentGroups;
  @HiveField(2)
  int? numSubgroup;
  @HiveField(3)
  List<String?>? auditories;
  @HiveField(4)
  String? startLessonTime;
  @HiveField(5)
  String? endLessonTime;
  @HiveField(6)
  String? subject;
  @HiveField(7)
  String? subjectFullName;
  @HiveField(8)
  String? note;
  @HiveField(9)
  String? lessonTypeAbbrev;
  @HiveField(10)
  String? dateLesson;
  @HiveField(11)
  List<Post?>? employees;
  @HiveField(12)
  String? startLessonDate;
  @HiveField(13)
  String? endLessonDate;
  @HiveField(14)
  String? announcementStart;
  @HiveField(15)
  String? announcementEnd;
  @HiveField(16)
  bool? announcement;
  @HiveField(17)
  bool? split;


  ScheduleDay(
      this.weekNumber,
      this.studentGroups,
      this.numSubgroup,
      this.auditories,
      this.startLessonTime,
      this.endLessonTime,
      this.subject,
      this.subjectFullName,
      this.note,
      this.lessonTypeAbbrev,
      this.dateLesson,
      this.employees,
      this.startLessonDate,
      this.endLessonDate,
      this.announcementStart,
      this.announcementEnd,
      this.announcement,
      this.split);

  factory ScheduleDay.fromJson(Map<String, dynamic> json) => _$ScheduleDayFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleDayToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 3)
class ScheduleWeek
{
  @HiveField(0)
  List<ScheduleDay?>? Monday;
  @HiveField(1)
  List<ScheduleDay?>? Tuesday;
  @HiveField(2)
  List<ScheduleDay?>? Wednesday;
  @HiveField(3)
  List<ScheduleDay?>? Thursday;
  @HiveField(4)
  List<ScheduleDay?>? Friday;
  @HiveField(5)
  List<ScheduleDay?>? Saturday;

  ScheduleWeek(this.Monday, this.Tuesday, this.Wednesday, this.Thursday,
      this.Friday, this.Saturday);
  factory ScheduleWeek.fromJson(Map<String, dynamic> json) => _$ScheduleWeekFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleWeekToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 2)
class ScheduleInfo
{
  @HiveField(0)
  Post? employeeDto;
  @HiveField(1)
  Group? studentGroupDto;
  @HiveField(2)
  ScheduleWeek? schedules;
  @HiveField(3)
  List<ScheduleDay?>? exams;
  @HiveField(4)
  String? startDate;
  @HiveField(5)
  String? endDate;
  @HiveField(6)
  String? startExamsDate;
  @HiveField(7)
  String? endExamsDate;

  ScheduleInfo(this.employeeDto, this.studentGroupDto, this.schedules,
      this.exams, this.startDate, this.endDate, this.startExamsDate,
      this.endExamsDate);

  factory ScheduleInfo.fromJson(Map<String, dynamic> json) => _$ScheduleInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleInfoToJson(this);
}

