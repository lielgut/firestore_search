import 'package:flutter/material.dart';

class SearchFiled extends StatefulWidget {
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
  State<SearchFiled> createState() => _SearchFiledState();
}

class _SearchFiledState extends State<SearchFiled> {
  late FocusNode searchFocusNode;

  @override
  void initState() {
    super.initState();
    searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.topCenter, children: [
      Center(
          child: Container(
              child: widget.isSearchTeacher!
                  ? Image.asset(
                      'assets/ui/images/woman_purple_bg.png',
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: widget.searchBackgroundColor ?? Colors.blueGrey.withOpacity(.2),
          ),
          child: TextField(
            controller: widget.searchQueryController,
            focusNode: searchFocusNode,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              hintText: widget.hintText == null ? "Search..." : widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintStyle: TextStyle(color: widget.searchTextHintColor),
              prefixIcon: IconButton(
                      icon: Image.asset(
                        'assets/ui/icons/search.png',
                        width: 16.4,
                        height: 16.55,
                      ),
                      onPressed: ()=>searchFocusNode.requestFocus(),
                    )
                 ,
              suffixIcon: widget.searchQueryController!.text.isNotEmpty
                  ? GestureDetector(
                      child: const Icon(Icons.close_rounded),
                      onTap: widget.onClearButtonPressed!,
                    )
                  : IconButton(
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
            style: TextStyle(color: widget.searchTextColor, fontSize: 16.0),
            onChanged: (query) => widget.onSearchQueryChanged!(query),
            // onSubmitted: (query) => onSearchQueryUpdated!(query),
            // onEditingComplete: () => onEditingComplete!,
          ),
        ),
      ),
    ]);
  }
}
