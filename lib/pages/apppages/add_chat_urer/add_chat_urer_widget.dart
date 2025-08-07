import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'add_chat_urer_model.dart';
export 'add_chat_urer_model.dart';

class AddChatUrerWidget extends StatefulWidget {
  const AddChatUrerWidget({
    super.key,
    required this.receivechat,
    required this.displayname,
  });

  final DocumentReference? receivechat;
  final String? displayname;

  static String routeName = 'add_chat_urer';
  static String routePath = '/addChatUrer';

  @override
  State<AddChatUrerWidget> createState() => _AddChatUrerWidgetState();
}

class _AddChatUrerWidgetState extends State<AddChatUrerWidget> {
  late AddChatUrerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddChatUrerModel());

    _model.messageTextController ??= TextEditingController();
    _model.messageFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<String?> uploadFile(File file, String filePath) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child(filePath);
      await storageRef.putFile(file);
      return await storageRef.getDownloadURL();
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ChatsRecord>(
      stream: ChatsRecord.getDocument(widget.receivechat!),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final addChatUrerChatsRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: AppBar(
                backgroundColor: Color(0xFFFFF8F1),
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: 30.0,
                  ),

                  onPressed: () async {
                    await widget.receivechat!.update({
                      ...mapToFirestore({
                        'lastMessageSeenBy': FieldValue.arrayUnion([currentUserReference]),
                      }),
                    });

                    context.pushNamed(UserChatWidget.routeName);
                  },
                ),
                title: Text(
                  valueOrDefault<String>(
                    widget.displayname,
                    'displayname',
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.tiroDevanagariSanskrit(),
                        color: Colors.black,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
                ),
                centerTitle: true,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder<List<ChatMessageRecord>>(
                      stream: queryChatMessageRecord(
                        parent: widget.receivechat,
                        queryBuilder: (chatMessageRecord) =>
                            chatMessageRecord.orderBy('timeStamp', descending: true),
                      ),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          );
                        }
                        List<ChatMessageRecord> messages = snapshot.data!;

                        return ListView.builder(
                          reverse: true,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final msg = messages[index];
                            final isSender = msg.uidOfSender == currentUserReference;

                            Widget content;
                            if (msg.fileUrl != null && msg.fileUrl!.isNotEmpty) {
                              if (msg.fileUrl!.endsWith('.jpg') ||
                                  msg.fileUrl!.endsWith('.jpeg') ||
                                  msg.fileUrl!.endsWith('.png') ||
                                  msg.fileUrl!.endsWith('.gif')) {
                                content = Image.network(
                                  msg.fileUrl!,
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                );
                              } else {
                                content = GestureDetector(
                                  onTap: () async {
                                    await launchUrl(Uri.parse(msg.fileUrl!));
                                  },
                                  child: Text(
                                    '📄 ${msg.filename ?? "File"} (Tap to open)',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue,
                                    ),
                                  ),
                                );
                              }
                            } else {
                              content = Text(
                                msg.message,
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: 'subheders',
                                      color: isSender ? Color(0xFFE6E8F3) : Colors.black,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              );
                            }

                            return Align(
                              alignment: isSender
                                  ? AlignmentDirectional(1.0, -1.0)
                                  : AlignmentDirectional(-1.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isSender ? Color(0xFFc25123) : Color(0xFFD7CBCB),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      content,
                                      SizedBox(height: 4),
                                      Text(
                                        dateTimeFormat(
                                          "relative",
                                          msg.timeStamp!,
                                          locale: FFLocalizations.of(context).languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              fontFamily: 'subheders',
                                              color: isSender ? Colors.white : Colors.black,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,

                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.attach_file),
                          onPressed: () async {
                            FilePickerResult? result = await FilePicker.platform.pickFiles(
                              allowMultiple: false,
                              type: FileType.any,
                            );

                            if (result != null && result.files.single.path != null) {
                              File file = File(result.files.single.path!);
                              String fileName = result.files.single.name;
                              String filePath = 'chat_files/${widget.receivechat!.id}/$fileName';
                              String? downloadUrl = await uploadFile(file, filePath);

                              if (downloadUrl != null) {
                                await ChatMessageRecord.createDoc(widget.receivechat!).set(
                                  createChatMessageRecordData(
                                    message: '',
                                    fileUrl: downloadUrl,
                                    filename: fileName,
                                    timeStamp: getCurrentTimestamp,
                                    uidOfSender: currentUserReference,
                                    nameofSender: currentUserDisplayName,
                                  ),
                                );

                                await widget.receivechat!.update({
                                  ...createChatsRecordData(
                                    lastmessage: '📄 $fileName',
                                    timestamp: getCurrentTimestamp,
                                  ),
                                  ...mapToFirestore({'lastMessageSeenBy': FieldValue.delete()}),
                                });

                                await widget.receivechat!.update({
                                  ...mapToFirestore({
                                    'lastMessageSeenBy': FieldValue.arrayUnion([currentUserReference]),
                                  }),
                                });
                              }
                            }
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextFormField(
                              controller: _model.messageTextController,
                              focusNode: _model.messageFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.messageTextController',
                                Duration(milliseconds: 0),
                                () => safeSetState(() {}),
                              ),

                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(

                                hintText: FFLocalizations.of(context).getText(
                                  'f3mjkvje' /* Type Your Message Here */,
                                ),
                                filled: true,
                                fillColor: Colors.white,

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style:TextStyle(
                                fontSize: 18,
                                color: Colors.black
                              ),
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: Color(0xFFc25123),
                          disabledColor: Color(0x59253334),
                          icon: Icon(
                            Icons.send_sharp,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: (_model.messageTextController.text == '')
                              ? null
                              : () async {
                                  await ChatMessageRecord.createDoc(widget.receivechat!).set(
                                    createChatMessageRecordData(
                                      message: _model.messageTextController.text,
                                      timeStamp: getCurrentTimestamp,
                                      uidOfSender: currentUserReference,
                                      nameofSender: currentUserDisplayName,
                                    ),
                                  );

                                  await widget.receivechat!.update({
                                    ...createChatsRecordData(
                                      lastmessage: _model.messageTextController.text,
                                      timestamp: getCurrentTimestamp,
                                    ),
                                    ...mapToFirestore({'lastMessageSeenBy': FieldValue.delete()}),
                                  });

                                  await widget.receivechat!.update({
                                    ...mapToFirestore({
                                      'lastMessageSeenBy': FieldValue.arrayUnion([currentUserReference]),
                                    }),
                                  });

                                  safeSetState(() {
                                    _model.messageTextController?.clear();
                                  });
                                },
                        ),
                        SizedBox(width: 8.0),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
