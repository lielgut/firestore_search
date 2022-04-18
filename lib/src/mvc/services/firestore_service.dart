library firestore_search;

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService<T> {
  final String? collectionName;
  final String? searchBy;
  final List Function(QuerySnapshot)? dataListFromSnapshot;
  final int? limitOfRetrievedData;

  FirestoreService(
      {this.collectionName,
      this.searchBy,
      this.dataListFromSnapshot,
      this.limitOfRetrievedData});

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<List> searchData(String query) {
    ///check if hebrew
    RegExp regExp = RegExp("[ -&(-+\-/-9=?-@^{}\u0590-\u05fe]", unicode: true);
    var isHebrew = regExp.hasMatch(query);
    final collectionReference = firebaseFirestore.collection(collectionName!);
    /* return query.isEmpty ? Stream.empty()
        : stream = collectionReference
            .orderBy('$searchBy', descending: false)
            .where('$searchBy', isGreaterThanOrEqualTo: query)
            .where('$searchBy', isLessThan: query + 'z')
            .limit(limitOfRetrievedData!)
            .snapshots()
            .map(dataListFromSnapshot!);*/
    //fix for hebrew
    if (query.isEmpty) {
      return collectionReference
          .limit(limitOfRetrievedData!)
          .snapshots()
          .map(dataListFromSnapshot!);
    } else if (isHebrew) {
      return collectionReference
          .orderBy('$searchBy', descending: false)
          .where('$searchBy', isGreaterThanOrEqualTo: query)
          .where('$searchBy', isLessThan: query + '\u05eb')
          .limit(limitOfRetrievedData!)
          .snapshots()
          .map(dataListFromSnapshot!);
    } else {
      return collectionReference
          .orderBy('$searchBy', descending: false)
          .where('$searchBy', isGreaterThanOrEqualTo: query)
          .where('$searchBy', isLessThan: query + 'z')
          .limit(limitOfRetrievedData!)
          .snapshots()
          .map(dataListFromSnapshot!);
    }
  }
}
