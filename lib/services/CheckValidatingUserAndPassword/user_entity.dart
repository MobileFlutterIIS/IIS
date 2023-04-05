import 'package:iis/generated/json/base/json_field.dart';
import 'package:iis/generated/json/user_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserEntity {
	int? id;
	String? firstName;
	String? lastName;
	String? middleName;
	String? birthDate;
	String? photoUrl;
	String? summary;
	int? rating;
	bool? showRating;
	bool? published;
	bool? searchJob;
	String? faculty;
	int? course;
	String? officeEmail;
	String? officePassword;
	String? speciality;
	String? studentGroup;
	List<UserSkills>? skills;
	List<UserReferences>? references;

	UserEntity();

	factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserEntityToJson(this);

	UserEntity copyWith({int? id, String? firstName, String? lastName, String? middleName, String? birthDate, String? photoUrl, String? summary, int? rating, bool? showRating, bool? published, bool? searchJob, String? faculty, int? course, String? officeEmail, String? officePassword, String? speciality, String? studentGroup, List<UserSkills>? skills, List<UserReferences>? references}) {
		return UserEntity()
			..id= id ?? this.id
			..firstName= firstName ?? this.firstName
			..lastName= lastName ?? this.lastName
			..middleName= middleName ?? this.middleName
			..birthDate= birthDate ?? this.birthDate
			..photoUrl= photoUrl ?? this.photoUrl
			..summary= summary ?? this.summary
			..rating= rating ?? this.rating
			..showRating= showRating ?? this.showRating
			..published= published ?? this.published
			..searchJob= searchJob ?? this.searchJob
			..faculty= faculty ?? this.faculty
			..course= course ?? this.course
			..officeEmail= officeEmail ?? this.officeEmail
			..officePassword= officePassword ?? this.officePassword
			..speciality= speciality ?? this.speciality
			..studentGroup= studentGroup ?? this.studentGroup
			..skills= skills ?? this.skills
			..references= references ?? this.references;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserSkills {
	int? id;
	String? name;

	UserSkills();

	factory UserSkills.fromJson(Map<String, dynamic> json) => $UserSkillsFromJson(json);

	Map<String, dynamic> toJson() => $UserSkillsToJson(this);

	UserSkills copyWith({int? id, String? name}) {
		return UserSkills()
			..id= id ?? this.id
			..name= name ?? this.name;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserReferences {
	int? id;
	String? name;
	String? reference;

	UserReferences();

	factory UserReferences.fromJson(Map<String, dynamic> json) => $UserReferencesFromJson(json);

	Map<String, dynamic> toJson() => $UserReferencesToJson(this);

	UserReferences copyWith({int? id, String? name, String? reference}) {
		return UserReferences()
			..id= id ?? this.id
			..name= name ?? this.name
			..reference= reference ?? this.reference;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}