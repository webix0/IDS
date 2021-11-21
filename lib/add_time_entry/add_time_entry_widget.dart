import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTimeEntryWidget extends StatefulWidget {
  AddTimeEntryWidget({Key key}) : super(key: key);

  @override
  _AddTimeEntryWidgetState createState() => _AddTimeEntryWidgetState();
}

class _AddTimeEntryWidgetState extends State<AddTimeEntryWidget>
    with TickerProviderStateMixin {
  DateTime datePicked1;
  DateTime datePicked2;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
    ),
  };

  @override
  void initState() {
    super.initState();
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Start Date',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF0D1724),
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 150,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color(0xFFE6E6E6),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 30, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 0),
                                          child: Text(
                                            dateTimeFormat('EEEE', datePicked1),
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'EB Garamond',
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Text(
                                            dateTimeFormat(
                                                'M/d h:m a', datePicked1),
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Arimo',
                                              color: FlutterFlowTheme.blue,
                                              fontSize: 20,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        30, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 0),
                                          child: Text(
                                            dateTimeFormat('EEEE', datePicked2),
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'EB Garamond',
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Text(
                                            dateTimeFormat(
                                                'M/d h:m a', datePicked2),
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Arimo',
                                              color: FlutterFlowTheme.blue,
                                              fontSize: 20,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ).animated([
                              animationsMap['containerOnActionTriggerAnimation']
                            ]),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: 40,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.ltBlue,
                              borderRadius: BorderRadius.circular(24),
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: InkWell(
                                onTap: () async {
                                  await DatePicker.showDateTimePicker(
                                    context,
                                    showTitleActions: true,
                                    onConfirm: (date) {
                                      setState(() => datePicked1 = date);
                                    },
                                    currentTime: getCurrentTimestamp,
                                  );
                                },
                                child: Text(
                                  'Change Start',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Arimo',
                                    color: Color(0xFF040000),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: 40,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.ltBlue,
                              borderRadius: BorderRadius.circular(24),
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: InkWell(
                                onTap: () async {
                                  await DatePicker.showDateTimePicker(
                                    context,
                                    showTitleActions: true,
                                    onConfirm: (date) {
                                      setState(() => datePicked2 = date);
                                    },
                                    currentTime: getCurrentTimestamp,
                                  );
                                },
                                child: Text(
                                  'Change End',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Arimo',
                                    color: Color(0xFF040000),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.95, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            setState(() => _loadingButton = true);
                            try {
                              final clockinoutLogsCreateData =
                                  createClockinoutLogsRecordData(
                                clockin: datePicked1,
                                clockout: datePicked2,
                                createdTime: getCurrentTimestamp,
                                employeeName: currentUserDisplayName,
                                employeeID: currentUserDisplayName,
                                phoneNumber: currentPhoneNumber,
                              );
                              await ClockinoutLogsRecord.collection
                                  .doc()
                                  .set(clockinoutLogsCreateData);
                            } finally {
                              setState(() => _loadingButton = false);
                            }
                          },
                          text: 'Add Entry',
                          options: FFButtonOptions(
                            width: 140,
                            height: 60,
                            color: FlutterFlowTheme.primaryColor,
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            elevation: 2,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 2,
                            ),
                            borderRadius: 8,
                          ),
                          loading: _loadingButton,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: AuthUserStreamWidget(
                child: StreamBuilder<List<ClockinoutLogsRecord>>(
                  stream: queryClockinoutLogsRecord(
                    queryBuilder: (clockinoutLogsRecord) => clockinoutLogsRecord
                        .where('phone_number', isEqualTo: currentPhoneNumber)
                        .orderBy('clockin', descending: true),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.primaryColor,
                          ),
                        ),
                      );
                    }
                    List<ClockinoutLogsRecord>
                        listViewClockinoutLogsRecordList = snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewClockinoutLogsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewClockinoutLogsRecord =
                            listViewClockinoutLogsRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            width: 100,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Container(
                                width: 60,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1, -0.55),
                                      child: StreamBuilder<
                                          List<ClockinoutLogsRecord>>(
                                        stream: queryClockinoutLogsRecord(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ClockinoutLogsRecord>
                                              dayClockinoutLogsRecordList =
                                              snapshot.data;
                                          return Text(
                                            dateTimeFormat(
                                                'EEEE',
                                                listViewClockinoutLogsRecord
                                                    .clockin),
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'EB Garamond',
                                              fontSize: 14,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 0),
                                      child: StreamBuilder<
                                          List<ClockinoutLogsRecord>>(
                                        stream: queryClockinoutLogsRecord(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ClockinoutLogsRecord>
                                              textClockinoutLogsRecordList =
                                              snapshot.data;
                                          return Text(
                                            dateTimeFormat(
                                                'Md',
                                                listViewClockinoutLogsRecord
                                                    .clockin),
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Arimo',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.dkGray,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -0.85, 0.05),
                                              child: StreamBuilder<
                                                  List<ClockinoutLogsRecord>>(
                                                stream:
                                                    queryClockinoutLogsRecord(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<ClockinoutLogsRecord>
                                                      textClockinoutLogsRecordList =
                                                      snapshot.data;
                                                  return Text(
                                                    '${dateTimeFormat('jm', listViewClockinoutLogsRecord.clockin)} - ${dateTimeFormat('jm', listViewClockinoutLogsRecord.clockout)}',
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Arimo',
                                                      color: FlutterFlowTheme
                                                          .tertiaryColor,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0.5, 0),
                                              child: StreamBuilder<
                                                  List<ClockinoutLogsRecord>>(
                                                stream:
                                                    queryClockinoutLogsRecord(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<ClockinoutLogsRecord>
                                                      textClockinoutLogsRecordList =
                                                      snapshot.data;
                                                  return Text(
                                                    dateTimeFormat(
                                                        'Hm',
                                                        listViewClockinoutLogsRecord
                                                            .clockin),
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Arimo',
                                                      color: FlutterFlowTheme
                                                          .tertiaryColor,
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
