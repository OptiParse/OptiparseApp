import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../common/color_extension.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image; // Hold a single image
  final int _maxFileSize = 5 * 1024 * 1024; // Max file size set to 5 MB

  // Method to capture images
  void _captureImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      final File file = File(image.path);
      final int fileSize = await file.length();

      // Check if the file size exceeds the limit
      if (fileSize > _maxFileSize) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image exceeds the 5 MB size limit.')),
        );
        return; // Return without setting the image if it exceeds the size limit
      }

      setState(() {
        _image = image;
      });
    }
  }

  // Method to remove the selected image
  void _removeImage() {
    setState(() {
      _image = null; // Reset the selected image
    });
  }

  // Method to open the selected image
  Future<void> _viewImage() async {
    if (_image != null) {
      final File file = File(_image!.path);
      // Display the image in a full-screen modal
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Image.file(
            file,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }

  // Simulate the image upload process
  void _uploadImage() {
    if (_image != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image uploaded successfully!')),
      );
      // Simulate the upload and reset the image after upload
      setState(() {
        _image = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      appBar: AppBar(
        title: Text(
          'Capture Images',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: TColor.gray,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Capture button (only shows if no image is selected)
            _image == null
                ? ElevatedButton(
                    onPressed: _captureImage,
                    child: Text('Capture Image'),
                  )
                : Container(), // Hide capture button if image is selected
            SizedBox(height: 20),
            // Preview section with cross icon (if image is selected)
            if (_image != null)
              Column(
                children: [
                  // Cross icon to remove the selected image
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.cancel, color: Colors.red, size: 30),
                      onPressed: _removeImage,
                    ),
                  ),
                  // Image preview (centered and covers half the screen)
                  GestureDetector(
                    onTap: _viewImage, // View full-size image on tap
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height /
                          2, // Half screen height
                      child: Image.file(
                        File(_image!.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Upload button
                  ElevatedButton(
                    onPressed: _uploadImage, // Upload the selected image
                    child: Text('Upload Image'),
                  ),
                ],
              )
            else
              Text('No image captured'), // Text to show if no image is captured
          ],
        ),
      ),
    );
  }
}
