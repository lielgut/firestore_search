import 'package:flutter/material.dart';

class SearchFiled extends StatelessWidget {
  final bool? showSearchIcon;
  final bool? isSearching;
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
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children:[
        Center(child: Container(child: Image.asset('assets/ui/images/thinking_woman_purple_bg.png',width: 328,height: 216,))),
        Positioned(
          top: 12,
          child: Container(
          alignment: Alignment.center,
          height: 42.0,
          width: 304,
          margin: showSearchIcon!
              ? const EdgeInsets.only(bottom: 3.5, top: 3.5, right: 2.0, left: 2.0)
              : isSearching!
                  ? const EdgeInsets.only(bottom: 3.5, top: 3.5, right: 10.0)
                  : const EdgeInsets.only(
                      bottom: 3.5, top: 3.5, right: 10.0, left: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: searchBackgroundColor ?? Colors.blueGrey.withOpacity(.2),
          ),
          child: TextField(
            controller: searchQueryController,
            focusNode: searchFocusNode,
            decoration: InputDecoration(
              hintText: hintText == null ? "Search...":hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintStyle: TextStyle(color: searchTextHintColor),
              prefixIcon: searchQueryController!.text.isEmpty ?  IconButton(
                alignment: Alignment.centerRight,
                icon: const Icon(Icons.search,color: Color(0xff4D20D3),),
                onPressed: onClearButtonPressed!,
                )
                  : const SizedBox(
              height: 0.0,
              width: 0.0,
              ),
              suffixIcon: searchQueryController!.text.isNotEmpty
                  ? IconButton(
                      alignment: Alignment.centerRight,
                      color: clearSearchButtonColor,
                      icon: const Icon(Icons.clear),
                      onPressed: onClearButtonPressed!,
                    )
                  : IconButton(
                alignment: Alignment.centerRight,
                color: clearSearchButtonColor,
                icon: const Icon(Icons.keyboard_voice_outlined),
                onPressed: (){} ,//TODO
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
        ),]
    );
  }
}
