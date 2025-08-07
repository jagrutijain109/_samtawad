// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

class CustomPageViewWithArrows extends StatefulWidget {
  const CustomPageViewWithArrows({
    Key? key,
    required this.height,
    required this.width,
    required this.itemsList,
    required this.currentIndex,
  }) : super(key: key);

  final double height;
  final double width;
  final List<dynamic> itemsList;
  final int currentIndex;

  @override
  _CustomPageViewWithArrowsState createState() =>
      _CustomPageViewWithArrowsState();
}

class _CustomPageViewWithArrowsState extends State<CustomPageViewWithArrows> {
  late PageController _pageController;
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.currentIndex;
    _pageController = PageController(initialPage: _currentPage);
  }

  void _goToPage(int index) {
    if (index >= 0 && index < widget.itemsList.length) {
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.itemsList.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final item = widget.itemsList[index] as Map<String, dynamic>;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (item['imageUrl'] != null)
                      Image.network(item['imageUrl'], height: 250),
                    if (item['title'] != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          item['title'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    const SizedBox(height: 20),

                    // The Icon Row Section (as per Canva design)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.info_outline,
                            size: 30, color: Color(0xFFC25123)),
                        SizedBox(width: 16),
                        Icon(Icons.camera_alt_outlined,
                            size: 30, color: Color(0xFFC25123)),
                        SizedBox(width: 16),
                        Icon(Icons.share_outlined,
                            size: 30, color: Color(0xFFC25123)),
                        SizedBox(width: 16),
                        Icon(Icons.favorite_border,
                            size: 30, color: Color(0xFFC25123)),
                        SizedBox(width: 16),
                        Icon(Icons.circle, size: 22, color: Colors.green),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),

          // Left arrow button
          Positioned(
            left: 8,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios,
                  size: 28, color: Color(0xFFC25123)),
              onPressed: () => _goToPage(_currentPage - 1),
            ),
          ),

          // Right arrow button
          Positioned(
            right: 8,
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios,
                  size: 28, color: Color(0xFFC25123)),
              onPressed: () => _goToPage(_currentPage + 1),
            ),
          ),
        ],
      ),
    );
  }
}
