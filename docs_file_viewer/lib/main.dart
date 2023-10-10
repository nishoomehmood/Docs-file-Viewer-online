import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const DocsViewer());
}

class DocsViewer extends StatefulWidget {
  const DocsViewer({super.key});

  @override
  State<DocsViewer> createState() => _DocsViewerState();
}

class _DocsViewerState extends State<DocsViewer> {
  Future<void> _launchURL(String url) async {
    if (!await canLaunch(url)) {
      throw 'Could not launch URL';
    }
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black54,
          body: Center(
            child: GestureDetector(
              onTap: () {
                _launchURL(
                    'https://docs.google.com/document/d/1JVOnn994j_W9GNE4p4NbnWiZN9mO5zZyXizLxUs6nig/edit?usp=drivesdk');
              },
              child: Container(
                width: 300,
                height: 70,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    "Doc File Viewer",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
