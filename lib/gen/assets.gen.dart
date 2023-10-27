/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/filter.png
  AssetGenImage get filter => const AssetGenImage('assets/icons/filter.png');

  /// File path: assets/icons/menu.png
  AssetGenImage get menu => const AssetGenImage('assets/icons/menu.png');

  /// List of all assets
  List<AssetGenImage> get values => [filter, menu];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_icon.png
  AssetGenImage get appIcon =>
      const AssetGenImage('assets/images/app_icon.png');

  /// File path: assets/images/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.png');

  /// File path: assets/images/carousel_img1.png
  AssetGenImage get carouselImg1 =>
      const AssetGenImage('assets/images/carousel_img1.png');

  /// File path: assets/images/carousel_img2.png
  AssetGenImage get carouselImg2 =>
      const AssetGenImage('assets/images/carousel_img2.png');

  /// File path: assets/images/carousel_img3.png
  AssetGenImage get carouselImg3 =>
      const AssetGenImage('assets/images/carousel_img3.png');

  /// File path: assets/images/dog_finder.jpeg
  AssetGenImage get dogFinder =>
      const AssetGenImage('assets/images/dog_finder.jpeg');

  /// File path: assets/images/dog_placeholder.png
  AssetGenImage get dogPlaceholder =>
      const AssetGenImage('assets/images/dog_placeholder.png');

  /// File path: assets/images/dog_wallapaper.png
  AssetGenImage get dogWallapaper =>
      const AssetGenImage('assets/images/dog_wallapaper.png');

  /// File path: assets/images/error_img.png
  AssetGenImage get errorImg =>
      const AssetGenImage('assets/images/error_img.png');

  /// File path: assets/images/sp1.png
  AssetGenImage get sp1 => const AssetGenImage('assets/images/sp1.png');

  /// File path: assets/images/sp2.png
  AssetGenImage get sp2 => const AssetGenImage('assets/images/sp2.png');

  /// File path: assets/images/sp3.png
  AssetGenImage get sp3 => const AssetGenImage('assets/images/sp3.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        appIcon,
        avatar,
        carouselImg1,
        carouselImg2,
        carouselImg3,
        dogFinder,
        dogPlaceholder,
        dogWallapaper,
        errorImg,
        sp1,
        sp2,
        sp3
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
