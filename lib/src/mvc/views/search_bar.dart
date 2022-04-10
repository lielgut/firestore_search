import 'package:firestore_search/firestore_search.dart';
import 'package:firestore_search/src/mvc/controllers/firestore_search_controller.dart';
import 'package:firestore_search/src/mvc/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirestoreSearchBar extends StatelessWidget {
  final Color? clearSearchButtonColor;
  final Color? searchBackgroundColor;
  final Color? searchTextColor;
  final Color? searchTextHintColor;
  final Color? searchBodyBackgroundColor;
  final Color? searchIconColor;
  final bool? showSearchIcon;
  final bool? isSearchTeacher;
  final String? tag;
  final String? hintText;

  FirestoreSearchBar(
      {required this.tag,
      this.clearSearchButtonColor,
      this.searchBackgroundColor,
      this.searchTextColor,
      this.searchTextHintColor,
      this.searchBodyBackgroundColor,
      this.searchIconColor,
      this.showSearchIcon = false,
      this.isSearchTeacher = false,
      this.hintText,
      Key? key}); // const FirestoreSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late FocusNode searchFocusNode;

    Get.put(FirestoreSearchController(), tag: tag);
    return GetBuilder<FirestoreSearchController>(
      initState: (GetBuilderState<FirestoreSearchController> builderState){
        searchFocusNode = FocusNode();},
        dispose: (GetBuilderState<FirestoreSearchController> builderState){
          searchFocusNode.dispose();},
        tag: tag,
        builder: (_controller) => SearchFiled(
              searchFocusNode: searchFocusNode,
              searchQueryController: _controller.searchQueryController.value,
              isSearching: _controller.isSearching.value,
              showSearchIcon: showSearchIcon,
              clearSearchButtonColor: clearSearchButtonColor,
              searchBackgroundColor: searchBackgroundColor,
              searchTextColor: searchTextColor,
              searchTextHintColor: searchTextHintColor,
              onClearButtonPressed: _controller.clearSearchQuery,
              onSearchQueryChanged: _controller.updateSearchQuery,
              hintText: hintText,
              isSearchTeacher: isSearchTeacher,
            ));
  }
}
