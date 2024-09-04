import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerPage extends StatefulWidget {
  @override
  _FilePickerPageState createState() => _FilePickerPageState();
}

class _FilePickerPageState extends State<FilePickerPage> {
  List<PlatformFile>? _files;

  void _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        _files = result.files;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Files'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _pickFiles,
              child: Text('Pick Files'),
            ),
            SizedBox(height: 20),
            _files != null
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _files!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_files![index].name),
                          subtitle: Text('${_files![index].size} bytes'),
                        );
                      },
                    ),
                  )
                : Text('No files selected'),
          ],
        ),
      ),
    );
  }
}
