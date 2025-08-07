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

/// Set your widget name, define your parameter, and then add the boilerplate
/// code using the green button on the right!
class NotepadSection extends StatefulWidget {
  final String userId;
  final double width;
  final double height;

  const NotepadSection({
    required this.userId,
    required this.width,
    required this.height,
  });

  @override
  _NotepadSectionState createState() => _NotepadSectionState();
}

class _NotepadSectionState extends State<NotepadSection> {
  late TextEditingController _controller;
  DocumentReference? _noteDoc;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _initNote();
  }

  Future<void> _initNote() async {
    final docRef =
    FirebaseFirestore.instance.collection('notes').doc(widget.userId);
    final doc = await docRef.get();

    if (doc.exists) {
      _controller.text = doc['noteText'] ?? '';
    } else {
      await docRef.set({
        'noteText': '',
        'timestamp': FieldValue.serverTimestamp(),
      });
    }

    setState(() {
      _noteDoc = docRef;
    });
  }

  Future<void> _saveNote() async {
    if (_noteDoc != null) {
      await _noteDoc!.update({
        'noteText': _controller.text.trim(),
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Note saved.')),
      );
    }
  }

  Future<void> _showSavedNotes() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('notes')
        .where(FieldPath.documentId, isEqualTo: widget.userId)
        .get();

    if (querySnapshot.docs.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No saved notes.')),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      builder: (context) => ListView(
        padding: EdgeInsets.all(16),
        children: querySnapshot.docs.map((doc) {
          final noteText = doc['noteText'] ?? '';
          return ListTile(
            title: Text(
              noteText.length > 50 ? '${noteText.substring(0, 50)}...' : noteText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Icon(Icons.more_vert),
            onTap: () {
              Navigator.pop(context);
              _showEditDeleteSheet(doc.reference, noteText);
            },
          );
        }).toList(),
      ),
    );
  }

  void _showEditDeleteSheet(DocumentReference docRef, String currentText) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('📓 Note Options', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),
            Text(currentText),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _controller.text = currentText;
                    _noteDoc = docRef;
                  },
                  icon: Icon(Icons.edit),
                  label: Text('Edit'),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () async {
                    await docRef.delete();
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Note deleted.')),
                    );
                  },
                  icon: Icon(Icons.delete),
                  label: Text('Delete'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Stack(
      children: [
        _noteDoc == null
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: widget.height,
              maxWidth: widget.width,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '📝 Your Notepad',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      controller: _controller,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        hintText: 'Paste or write anything here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: _saveNote,
                      icon: Icon(Icons.save),
                      label: Text('Save'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          // bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: _showSavedNotes,
            child: Icon(Icons.note),
            backgroundColor: Colors.deepPurple,
            tooltip: 'View Notes',
          ),
        ),
      ],
    );
  }
}

