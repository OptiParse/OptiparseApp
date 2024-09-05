import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';
import '../common/color_extension.dart';

class FilePickerPage extends StatefulWidget {
  @override
  _FilePickerPageState createState() => _FilePickerPageState();
}

class _FilePickerPageState extends State<FilePickerPage> {
  PlatformFile? _file; // Holds the selected file
  final int _maxFileSize = 5242880; // Maximum file size (5MB)

  // Method to pick a file
  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      withData:
          false, // Do not get file bytes to avoid loading large files into memory
    );

    if (result != null) {
      PlatformFile selectedFile = result.files.first;

      // Check if the file size exceeds the maximum allowed size
      if (selectedFile.size > _maxFileSize) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File size exceeds the 5MB limit.')),
        );
      } else {
        setState(() {
          _file = selectedFile;
        });
      }
    }
  }

  // Method to remove the selected file
  void _removeFile() {
    setState(() {
      _file = null;
    });
  }

  // Request storage permissions before opening the file
  Future<void> _requestPermissions() async {
    PermissionStatus status = await Permission.storage.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Storage permission is required to open files')),
      );
    }
  }

  // Build file preview widget
  Widget _buildFilePreview() {
    if (_file != null) {
      String ext = _file!.extension ?? '';
      if (['jpg', 'jpeg', 'png', 'gif', 'bmp'].contains(ext)) {
        // Image preview
        return FutureBuilder(
          future: _file!.bytes != null
              ? Future.value(_file!.bytes!)
              : Future.value(null),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return Image.memory(
                snapshot.data!,
                height: MediaQuery.of(context).size.height /
                    2, // Half screen height
                fit: BoxFit.cover,
              );
            } else if (snapshot.hasError) {
              return Text('Unable to load image.');
            }
            return CircularProgressIndicator();
          },
        );
      } else if (ext == 'pdf') {
        // PDF file preview placeholder
        return Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.picture_as_pdf, size: 80, color: Colors.red),
                SizedBox(height: 10),
                Text('Preview PDF (first page)'),
                ElevatedButton(
                  onPressed: () async {
                    await _requestPermissions(); // Ensure permissions are granted
                    if (_file!.path != null) {
                      OpenFilex.open(
                          _file!.path!); // Open PDF using the default viewer
                    }
                  },
                  child: Text('Open PDF'),
                ),
              ],
            ),
          ),
        );
      } else {
        // Other file types placeholder
        return Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.insert_drive_file, size: 80, color: Colors.grey),
                SizedBox(height: 10),
                Text('Preview for ${_file!.name}'),
                ElevatedButton(
                  onPressed: () async {
                    await _requestPermissions(); // Ensure permissions are granted
                    if (_file!.path != null) {
                      OpenFilex.open(
                          _file!.path!); // Open file using the default viewer
                    }
                  },
                  child: Text('Open File'),
                ),
              ],
            ),
          ),
        );
      }
    }
    return Text('No file selected');
  }

  // Simulated file upload function
  void _uploadFile() {
    if (_file != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File "${_file!.name}" uploaded successfully!')),
      );
      // Simulate the upload and reset the selected file after upload
      setState(() {
        _file = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      appBar: AppBar(
        title: Text(
          'Select File',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: TColor.gray,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _file == null // Show pick file button only if no file is selected
                ? ElevatedButton(
                    onPressed: _pickFile,
                    child: Text('Pick File'),
                  )
                : Container(),
            SizedBox(height: 20),
            if (_file !=
                null) // Display preview and upload button if a file is selected
              Column(
                children: [
                  // Cross icon to delete the selected file
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.cancel, color: Colors.red, size: 30),
                      onPressed: _removeFile,
                    ),
                  ),
                  // File preview section
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 2,
                    child: _buildFilePreview(),
                  ),
                  SizedBox(height: 20),
                  // Upload button
                  ElevatedButton(
                    onPressed: _uploadFile, // Upload the selected file
                    child: Text('Upload File'),
                  ),
                ],
              )
            else
              Text('No file selected'),
          ],
        ),
      ),
    );
  }
}
