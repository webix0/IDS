import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'clockinout_logs_record.g.dart';

abstract class ClockinoutLogsRecord
    implements Built<ClockinoutLogsRecord, ClockinoutLogsRecordBuilder> {
  static Serializer<ClockinoutLogsRecord> get serializer =>
      _$clockinoutLogsRecordSerializer;

  @nullable
  String get employeeName;

  @nullable
  DateTime get clockin;

  @nullable
  DateTime get clockout;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  String get employeeID;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ClockinoutLogsRecordBuilder builder) => builder
    ..employeeName = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..employeeID = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clockinout_logs');

  static Stream<ClockinoutLogsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ClockinoutLogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ClockinoutLogsRecord._();
  factory ClockinoutLogsRecord(
          [void Function(ClockinoutLogsRecordBuilder) updates]) =
      _$ClockinoutLogsRecord;

  static ClockinoutLogsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createClockinoutLogsRecordData({
  String employeeName,
  DateTime clockin,
  DateTime clockout,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  String employeeID,
}) =>
    serializers.toFirestore(
        ClockinoutLogsRecord.serializer,
        ClockinoutLogsRecord((c) => c
          ..employeeName = employeeName
          ..clockin = clockin
          ..clockout = clockout
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..employeeID = employeeID));
