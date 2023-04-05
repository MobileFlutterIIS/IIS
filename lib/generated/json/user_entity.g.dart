import 'package:iis/generated/json/base/json_convert_content.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
	final UserEntity userEntity = UserEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userEntity.id = id;
	}
	final String? firstName = jsonConvert.convert<String>(json['firstName']);
	if (firstName != null) {
		userEntity.firstName = firstName;
	}
	final String? lastName = jsonConvert.convert<String>(json['lastName']);
	if (lastName != null) {
		userEntity.lastName = lastName;
	}
	final String? middleName = jsonConvert.convert<String>(json['middleName']);
	if (middleName != null) {
		userEntity.middleName = middleName;
	}
	final String? birthDate = jsonConvert.convert<String>(json['birthDate']);
	if (birthDate != null) {
		userEntity.birthDate = birthDate;
	}
	final String? photoUrl = jsonConvert.convert<String>(json['photoUrl']);
	if (photoUrl != null) {
		userEntity.photoUrl = photoUrl;
	}
	final String? summary = jsonConvert.convert<String>(json['summary']);
	if (summary != null) {
		userEntity.summary = summary;
	}
	final int? rating = jsonConvert.convert<int>(json['rating']);
	if (rating != null) {
		userEntity.rating = rating;
	}
	final bool? showRating = jsonConvert.convert<bool>(json['showRating']);
	if (showRating != null) {
		userEntity.showRating = showRating;
	}
	final bool? published = jsonConvert.convert<bool>(json['published']);
	if (published != null) {
		userEntity.published = published;
	}
	final bool? searchJob = jsonConvert.convert<bool>(json['searchJob']);
	if (searchJob != null) {
		userEntity.searchJob = searchJob;
	}
	final String? faculty = jsonConvert.convert<String>(json['faculty']);
	if (faculty != null) {
		userEntity.faculty = faculty;
	}
	final int? course = jsonConvert.convert<int>(json['course']);
	if (course != null) {
		userEntity.course = course;
	}
	final String? officeEmail = jsonConvert.convert<String>(json['officeEmail']);
	if (officeEmail != null) {
		userEntity.officeEmail = officeEmail;
	}
	final String? officePassword = jsonConvert.convert<String>(json['officePassword']);
	if (officePassword != null) {
		userEntity.officePassword = officePassword;
	}
	final String? speciality = jsonConvert.convert<String>(json['speciality']);
	if (speciality != null) {
		userEntity.speciality = speciality;
	}
	final String? studentGroup = jsonConvert.convert<String>(json['studentGroup']);
	if (studentGroup != null) {
		userEntity.studentGroup = studentGroup;
	}
	final List<UserSkills>? skills = jsonConvert.convertListNotNull<UserSkills>(json['skills']);
	if (skills != null) {
		userEntity.skills = skills;
	}
	final List<UserReferences>? references = jsonConvert.convertListNotNull<UserReferences>(json['references']);
	if (references != null) {
		userEntity.references = references;
	}
	return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['firstName'] = entity.firstName;
	data['lastName'] = entity.lastName;
	data['middleName'] = entity.middleName;
	data['birthDate'] = entity.birthDate;
	data['photoUrl'] = entity.photoUrl;
	data['summary'] = entity.summary;
	data['rating'] = entity.rating;
	data['showRating'] = entity.showRating;
	data['published'] = entity.published;
	data['searchJob'] = entity.searchJob;
	data['faculty'] = entity.faculty;
	data['course'] = entity.course;
	data['officeEmail'] = entity.officeEmail;
	data['officePassword'] = entity.officePassword;
	data['speciality'] = entity.speciality;
	data['studentGroup'] = entity.studentGroup;
	data['skills'] =  entity.skills?.map((v) => v.toJson()).toList();
	data['references'] =  entity.references?.map((v) => v.toJson()).toList();
	return data;
}

UserSkills $UserSkillsFromJson(Map<String, dynamic> json) {
	final UserSkills userSkills = UserSkills();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userSkills.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		userSkills.name = name;
	}
	return userSkills;
}

Map<String, dynamic> $UserSkillsToJson(UserSkills entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}

UserReferences $UserReferencesFromJson(Map<String, dynamic> json) {
	final UserReferences userReferences = UserReferences();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userReferences.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		userReferences.name = name;
	}
	final String? reference = jsonConvert.convert<String>(json['reference']);
	if (reference != null) {
		userReferences.reference = reference;
	}
	return userReferences;
}

Map<String, dynamic> $UserReferencesToJson(UserReferences entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['reference'] = entity.reference;
	return data;
}