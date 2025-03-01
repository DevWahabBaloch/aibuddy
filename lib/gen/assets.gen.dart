/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/JosefinSans-Bold.ttf
  String get josefinSansBold => 'assets/fonts/JosefinSans-Bold.ttf';

  /// File path: assets/fonts/JosefinSans-BoldItalic.ttf
  String get josefinSansBoldItalic => 'assets/fonts/JosefinSans-BoldItalic.ttf';

  /// File path: assets/fonts/JosefinSans-ExtraLight.ttf
  String get josefinSansExtraLight => 'assets/fonts/JosefinSans-ExtraLight.ttf';

  /// File path: assets/fonts/JosefinSans-ExtraLightItalic.ttf
  String get josefinSansExtraLightItalic =>
      'assets/fonts/JosefinSans-ExtraLightItalic.ttf';

  /// File path: assets/fonts/JosefinSans-Italic.ttf
  String get josefinSansItalic => 'assets/fonts/JosefinSans-Italic.ttf';

  /// File path: assets/fonts/JosefinSans-Light.ttf
  String get josefinSansLight => 'assets/fonts/JosefinSans-Light.ttf';

  /// File path: assets/fonts/JosefinSans-LightItalic.ttf
  String get josefinSansLightItalic =>
      'assets/fonts/JosefinSans-LightItalic.ttf';

  /// File path: assets/fonts/JosefinSans-Medium.ttf
  String get josefinSansMedium => 'assets/fonts/JosefinSans-Medium.ttf';

  /// File path: assets/fonts/JosefinSans-MediumItalic.ttf
  String get josefinSansMediumItalic =>
      'assets/fonts/JosefinSans-MediumItalic.ttf';

  /// File path: assets/fonts/JosefinSans-Regular.ttf
  String get josefinSansRegular => 'assets/fonts/JosefinSans-Regular.ttf';

  /// File path: assets/fonts/JosefinSans-SemiBold.ttf
  String get josefinSansSemiBold => 'assets/fonts/JosefinSans-SemiBold.ttf';

  /// File path: assets/fonts/JosefinSans-SemiBoldItalic.ttf
  String get josefinSansSemiBoldItalic =>
      'assets/fonts/JosefinSans-SemiBoldItalic.ttf';

  /// File path: assets/fonts/JosefinSans-Thin.ttf
  String get josefinSansThin => 'assets/fonts/JosefinSans-Thin.ttf';

  /// File path: assets/fonts/JosefinSans-ThinItalic.ttf
  String get josefinSansThinItalic => 'assets/fonts/JosefinSans-ThinItalic.ttf';

  /// List of all assets
  List<String> get values => [
        josefinSansBold,
        josefinSansBoldItalic,
        josefinSansExtraLight,
        josefinSansExtraLightItalic,
        josefinSansItalic,
        josefinSansLight,
        josefinSansLightItalic,
        josefinSansMedium,
        josefinSansMediumItalic,
        josefinSansRegular,
        josefinSansSemiBold,
        josefinSansSemiBoldItalic,
        josefinSansThin,
        josefinSansThinItalic
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/button.png
  AssetGenImage get button => const AssetGenImage('assets/icons/button.png');

  /// File path: assets/icons/chevron.png
  AssetGenImage get chevron => const AssetGenImage('assets/icons/chevron.png');

  /// File path: assets/icons/menu.png
  AssetGenImage get menu => const AssetGenImage('assets/icons/menu.png');

  /// File path: assets/icons/mic.png
  AssetGenImage get mic => const AssetGenImage('assets/icons/mic.png');

  /// File path: assets/icons/qrcode.png
  AssetGenImage get qrcode => const AssetGenImage('assets/icons/qrcode.png');

  /// File path: assets/icons/send.png
  AssetGenImage get send => const AssetGenImage('assets/icons/send.png');

  /// List of all assets
  List<AssetGenImage> get values => [button, chevron, menu, mic, qrcode, send];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/googleicon.png
  AssetGenImage get googleicon =>
      const AssetGenImage('assets/images/googleicon.png');

  /// File path: assets/images/im1.png
  AssetGenImage get im1 => const AssetGenImage('assets/images/im1.png');

  /// File path: assets/images/messages.png
  AssetGenImage get messages =>
      const AssetGenImage('assets/images/messages.png');

  /// File path: assets/images/padlock.png
  AssetGenImage get padlock => const AssetGenImage('assets/images/padlock.png');

  /// File path: assets/images/unlock.png
  AssetGenImage get unlock => const AssetGenImage('assets/images/unlock.png');

  /// File path: assets/images/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/user.png');

  /// File path: assets/images/user_p.png
  AssetGenImage get userP => const AssetGenImage('assets/images/user_p.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [googleicon, im1, messages, padlock, unlock, user, userP];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/bot1.svg
  String get bot1 => 'assets/svgs/bot1.svg';

  /// File path: assets/svgs/bot2.svg
  String get bot2 => 'assets/svgs/bot2.svg';

  /// File path: assets/svgs/bot3.svg
  String get bot3 => 'assets/svgs/bot3.svg';

  /// List of all assets
  List<String> get values => [bot1, bot2, bot3];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
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
