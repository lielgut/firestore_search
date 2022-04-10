import 'package:flutter/material.dart';

class SearchFiled extends StatelessWidget {
  final bool? showSearchIcon;
  final bool? isSearching;
  final bool? isSearchTeacher;
  final Color? searchBackgroundColor;
  final Color? searchTextHintColor;
  final Color? clearSearchButtonColor;
  final Color? searchTextColor;
  final FocusNode? searchFocusNode;
  final Function()? onClearButtonPressed;
  final Function(String)? onSearchQueryChanged;
  final Function(String)? onSearchQueryUpdated;
  final Function(String)? onEditingComplete;
  final String? hintText;
  TextEditingController? searchQueryController;

  SearchFiled(
      {this.showSearchIcon = false,
      this.isSearching = false,
      this.isSearchTeacher,
      this.searchBackgroundColor,
      this.searchTextColor,
      this.searchTextHintColor,
      this.clearSearchButtonColor,
      this.searchFocusNode,
      this.searchQueryController,
      this.onClearButtonPressed,
      this.onSearchQueryChanged,
      this.onSearchQueryUpdated,
      this.onEditingComplete,
      this.hintText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.topCenter, children: [
      Center(
          child: Container(
              child: isSearchTeacher!
                  ? Image.asset(
                      'assets/ui/images/woman_purple_bg.png',
                      // width: 328,
                      // height: 216,
                    )
                  : Image.asset(
                      'assets/ui/images/thinking_woman_purple_bg.png',
                      width: 328,
                      height: 216,
                    ))),
      Positioned(
        top: 12,
        child: Container(
          alignment: Alignment.center,
          height: 42.0,
          width: 304,
          /*margin: showSearchIcon!
              ? const EdgeInsets.only(
                  bottom: 3.5, top: 3.5, right: 2.0, left: 2.0)
              : isSearching!
                  ? const EdgeInsets.only(bottom: 3.5, top: 3.5, right: 10.0)
                  : const EdgeInsets.only(
                      bottom: 3.5, top: 3.5, right: 10.0, left: 10.0),*/
          // padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: searchBackgroundColor ?? Colors.blueGrey.withOpacity(.2),
          ),
          child: TextField(
            controller: searchQueryController,
            focusNode: searchFocusNode,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              hintText: hintText == null ? "Search..." : hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintStyle: TextStyle(color: searchTextHintColor),
              prefixIcon: IconButton(
                      /*padding: EdgeInsetsDirectional.only(start: 15.8),
                      constraints: BoxConstraints(),
                      alignment: Alignment.centerRight,*/
                      icon: Image.asset(
                        'assets/ui/icons/search.png',
                        width: 16.4,
                        height: 16.55,
                      ),
                      onPressed: onClearButtonPressed!,
                    )
                 ,
              suffixIcon: searchQueryController!.text.isNotEmpty
                  ? GestureDetector(
                      /*padding: EdgeInsetsDirectional.only(start: 16.29),
                      constraints: BoxConstraints(),
                      alignment: Alignment.centerRight,
                      color: clearSearchButtonColor,*/
                      child: const Icon(Icons.close_rounded),
                      onTap: onClearButtonPressed!,
                    )
                  : IconButton(
                      /*padding: EdgeInsetsDirectional.only(start: 16.29),
                      constraints: BoxConstraints(),
                      alignment: Alignment.centerRight,*/
                      icon: Image.asset(
                        'assets/ui/icons/microphone.png',
                        width: 14.58,
                        height: 20.88,
                      ),
                      onPressed: () {}, //TODO
                    ),
            ),
            textAlignVertical: TextAlignVertical.center,
            textInputAction: TextInputAction.search,
            style: TextStyle(color: searchTextColor, fontSize: 16.0),
            onChanged: (query) => onSearchQueryChanged!(query),
            // onSubmitted: (query) => onSearchQueryUpdated!(query),
            // onEditingComplete: () => onEditingComplete!,
          ),
        ),
      ),
    ]);
  }
}
