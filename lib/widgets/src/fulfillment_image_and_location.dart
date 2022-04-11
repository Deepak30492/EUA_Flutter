import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uhi_eua_flutter_app/theme/theme.dart';
import 'package:uhi_eua_flutter_app/widgets/widgets.dart';

class FulfillmentImageAndLocation extends StatelessWidget {
  double width;
  String imageUrl;
  String hospitalName;
  String distance;

  FulfillmentImageAndLocation({
    Key? key,
    required this.width,
    required this.imageUrl,
    required this.hospitalName,
    required this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppShadows.shadow2,
      ),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) {
              return Container(
                width: width * 0.5,
                height: width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: imageUrl.contains("https")
                        ? imageProvider
                        : Image.file(File(imageUrl)).image,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            placeholder: (context, url) => Center(
                child: Container(
              width: width * 0.5,
              height: width * 0.5,
              child: Center(
                child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.secondaryOrangeFF8A07,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primaryLightBlue007BFF,
                      ),
                    )),
              ),
            )),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Spacing(isWidth: false),
          Container(
            child: Text(
              //  "Max Hospital, Skin Specialist",
              hospitalName,
              style: AppTextStyle.hospitalNameBigTextStyle,
            ),
          ),
          Spacing(isWidth: false),
          Container(
            child: Text(
              "1.2 km away",
              style: AppTextStyle.locationDistanceBigTextStyle,
            ),
          ),
          Spacing(isWidth: false),
        ],
      ),
    );
  }
}
