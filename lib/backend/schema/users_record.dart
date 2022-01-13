import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get firstName;

  @nullable
  String get lastName;

  @nullable
  String get email;

  @nullable
  String get password;

  @nullable
  DateTime get hireDate;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  String get uid;

  @nullable
  int get employeeId;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..firstName = ''
    ..lastName = ''
    ..email = ''
    ..password = ''
    ..displayName = ''
    ..photoUrl = ''
    ..phoneNumber = ''
    ..uid = ''
    ..employeeId = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String firstName,
  String lastName,
  String email,
  String password,
  DateTime hireDate,
  String displayName,
  String photoUrl,
  DateTime createdTime,
  String phoneNumber,
  String uid,
  int employeeId,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..firstName = firstName
          ..lastName = lastName
          ..email = email
          ..password = password
          ..hireDate = hireDate
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..uid = uid
          ..employeeId = employeeId));
