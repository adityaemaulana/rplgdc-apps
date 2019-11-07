import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseFunction {
  uploadToStorage(File img) async {
    final StorageReference storageRef = FirebaseStorage.instance.ref().child("image-1.jpg");
    final StorageUploadTask uploadTask = storageRef.putFile(img);
    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    final String url = (await downloadUrl.ref.getDownloadURL());
    print('URL Is $url');
    return url;
  }
}

class ImageFunction {
  Future<File> getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    return image;
  }
}
