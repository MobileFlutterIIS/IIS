import "package:json_annotation/json_annotation.dart";
import "package:retrofit/retrofit.dart";
import "package:dio/dio.dart";
import 'package:hive/hive.dart';
import 'package:iis/services/ScheduleAndListFromNet/ApiSchedule.dart';

part 'DormDipPenalty.g.dart';

@JsonSerializable()
class DormReq{

 int? acceptedDate;
 int? applicationDate;
 String? docContent;
 String? docReference;
 int? id;
 int? number;
 int? numberInQueue;
 String? rejectionReason;
 String? roomInfo;
 int? settledDate;
 String? status;


 DormReq(
      this.acceptedDate,
      this.applicationDate,
      this.docContent,
      this.docReference,
      this.id,
      this.number,
      this.numberInQueue,
      this.rejectionReason,
      this.roomInfo,
      this.settledDate,
      this.status);

  factory DormReq.fromJson(Map<String, dynamic> json) => _$DormReqFromJson(json);
  Map<String, dynamic> toJson() => _$DormReqToJson(this);
}
