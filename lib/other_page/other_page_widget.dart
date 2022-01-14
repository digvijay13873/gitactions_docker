import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherPageWidget extends StatefulWidget {
  const OtherPageWidget({Key key}) : super(key: key);

  @override
  _OtherPageWidgetState createState() => _OtherPageWidgetState();
}

class _OtherPageWidgetState extends State<OtherPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Text(
          'Other Page',
          style: FlutterFlowTheme.bodyText1,
        ),
      ),
    );
  }
}
