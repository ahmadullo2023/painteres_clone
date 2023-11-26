import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final _firebaseStorage = FirebaseFirestore.instance;
  Future collectionService(
    String username,
    String userEmail,
    userPassword,
  ) async {
    try {
      final firebaseCollection = _firebaseStorage.collection("users");
      final firebaseCloud = await firebaseCollection.add({
        "username": username,
        "userEmail": userEmail,
        "userPassword": userPassword,
      });
      return firebaseCloud;
    } catch (e) {
      throw Exception("error firebase collection service $e");
    }
  }
}
