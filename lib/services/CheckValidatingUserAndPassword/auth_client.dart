import 'package:json_annotation/json_annotation.dart';

class ReferenceDto {
  int id; // 4371881
  String name; // TG
  String reference;

  ReferenceDto({
    required this.id,
    required this.name,
    required this.reference
  });
}

class SkillDto{
  int id;
  String name;

  SkillDto({
    required this.id,
    required this.name
  });
}

//@JsonSerializable()
class UserProfile {
  String birthDate;
  int course;
  String faculty;
  String firstName;
  int id;
  String lastName;
  String middleName;
  String officeEmail;
  String officePassword;
  String photoUrl;
  bool published;
  int rating;
  List<ReferenceDto> references;
  bool searchJob;
  bool showRating;
  List<SkillDto> skills;
  String speciality;
  String studentGroup;
  String summary;

  UserProfile({
    required this.birthDate,
    required this.course,
    required this.faculty,
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.middleName,
    required this.officeEmail,
    required this.officePassword,
    required this.photoUrl,
    required this.published,
    required this.rating,
    required this.references,
    required this.searchJob,
    required this.showRating,
    required this.skills,
    required this.speciality,
    required this.studentGroup,
    required this.summary,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json){
    return UserProfile(
      birthDate: json['birthDate'],
      course: json['course'],
      faculty: json['faculty'],
      firstName: json['firstName'],
      id: json['id'],
      lastName: json['lastName'],
      middleName: json['middleName'],
      officeEmail: json['officeEmail,'],
      officePassword: json['officePassword'],
      photoUrl: json['photoUrl'],
      published: json['published'],
      rating: json['rating'],
      references: json['references'],
      searchJob: json['searchJob'],
      showRating: json['showRating'],
      skills: json['skills'],
      speciality: json['speciality'],
      studentGroup: json['studentGroup'],
      summary: json['summary'],
    );
  }

  Map<String,dynamic> toJson() {
    return {
      'birthDate':birthDate,
      'course':course,
      'faculty':faculty,
      'firstName':firstName,
      'id':id,
      'lastName':lastName,
      'middleName':middleName,
      'officeEmail':officeEmail,
      'officePassword':officePassword,
      'photoUrl':photoUrl,
      'published':published,
      'rating':rating,
      'references':references,
      'searchJob':searchJob,
      'showRating':showRating,
      'skills':skills,
      'speciality':speciality,
      'studentGroup':studentGroup,
      'summary':summary,
    };
  }
}
