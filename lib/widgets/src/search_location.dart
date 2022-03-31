import 'package:flutter/material.dart';
import 'package:uhi_eua_flutter_app/theme/theme.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  ///SIZE
  var width;
  var height;
  var isPortrait;

  @override
  Widget build(BuildContext context) {
    ///ASSIGNING VALUES
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    isPortrait = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.chevron_left_rounded,
          color: AppColors.greyHint828282,
          size: 30,
        ),
        backgroundColor: AppColors.white,
        title: Container(
          child: Container(
            width: width * 0.9,
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: TextField(
              // controller: _textEditingController,
              style: AppTextStyle.textFieldTextStyle,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                enabledBorder: const UnderlineInputBorder(),
                focusedBorder: const UnderlineInputBorder(),
                hintText: "Search location",
                hintStyle: AppTextStyle.textFieldHintTextStyle,
                contentPadding: const EdgeInsets.only(top: 10, left: 10),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(
                    Icons.place_outlined,
                    color: AppColors.grey8B8B8B,
                    size: 20,
                  ),
                ),
                prefixIconConstraints:
                    const BoxConstraints(maxWidth: 30, maxHeight: 10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
