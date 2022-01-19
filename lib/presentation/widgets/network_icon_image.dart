import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nectar_app/presentation/widgets/loading_indicator.dart';

import '../../size_cofig.dart';

class NetworkIconImage extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  const NetworkIconImage({
    Key? key,
    required this.width,
    required this.height,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(height),
      width: getProportionateScreenWidth(width),
      child: CachedNetworkImage(
        placeholder: (context, url) => const LoadingIndicator(),
        imageUrl: image,
      ),
    );
  }
}
