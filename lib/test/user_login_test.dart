import 'package:flutter_test/flutter_test.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/AccountManager.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/CertificateGroupAnouncements.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/MarkBook.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/GradeBook.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/Omissions.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/ContactsToReset.dart';

void main(){

  test('signIn должен возвращать правильную сущность UserEntity', () async{
    final user = await AccountManager.signIn("25350088", "Svetlyach**88");
    expect(user, isA<UserEntity>());
  });

  test('UserCetificate должен возвращать правильный список Certificate', () async {
    final user = await AccountManager.signIn("25350088", "Svetlyach**88");
    final certificates = await AccountManager.UserCetificate();
    expect(certificates, isA<List<Certificate>>());
  });

  test('UserGroupInfo должен возвращать правильную Groupinfo', () async {
    final user = await AccountManager.signIn("25350088", "Svetlyach**88");
    final groupInfo = await AccountManager.UserGroupInfo();
    expect(groupInfo,isA<Groupinfo>());
  });

  test('UserMarkSheets должен возвращать правильный список MarkSheet', () async {
    final user = await AccountManager.signIn("25350088", "Svetlyach**88");
    final markSheets = await AccountManager.UserMarkSheets();
    expect(markSheets, isA<List<MarkSheet>>());
  });

  test('UserMarkBook должен возвращать правильную сущность Markbook', () async {
    final user = await AccountManager.signIn("25350088", "Svetlyach**88");
    final markbook = await AccountManager.UserMarkBook();
    expect(markbook, isA<Markbook>());
  });

  test('UserGradeBook должен возвращать правильную список Gradebook', () async{
    final user = await AccountManager.signIn("25350088", "Svetlyach**88");
    final gradebook = await AccountManager.UserGradeBook();
    expect(gradebook, isA<List<GradeBook>>());
  });

  test('UserOmissions должен возвращать правильную список Omissions', () async{
    final user = await AccountManager.signIn("25350088", "Svetlyach**88");
    final omissions = await AccountManager.UserOmissions();
    expect(omissions, isA<List<Omission>>());
  });

  test('CheckPassword должен возвращать правильную сущность ContactsToReset', () async{
    final contactstoreset = await AccountManager.CheckPassword("25350088");
    expect(contactstoreset, isA<ContactsToReset>());
  });

  test('PhoneNumberToResetPassword должен возвращать правильную сущность ContactsToReset', () async{
    final contactstoreset = await AccountManager.PhoneNumberToResetPassword("+375445854190", "25350088");
    expect(contactstoreset, isA<ContactsToReset>());
  });
}