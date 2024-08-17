import 'package:babstrap_settings_screen/src/icon_style.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final IconData? icons;
  final ImageProvider? iconImage;
  final IconStyle? iconStyle;
  final String title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final int? titleMaxLine;
  final int? subtitleMaxLine;
  final TextOverflow? overflow;

  SettingsItem(
      {this.icons,
      this.iconImage,
      this.iconStyle,
      required this.title,
      this.titleStyle,
      this.subtitle,
      this.subtitleStyle,
      this.backgroundColor,
      this.trailing,
      this.onTap,
      this.titleMaxLine,
      this.subtitleMaxLine,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    Widget? iconWidget;
    if (icons != null) {
      if (iconStyle != null && iconStyle!.withBackground!) {
        iconWidget = Container(
          decoration: BoxDecoration(
            color: iconStyle!.backgroundColor,
            borderRadius: BorderRadius.circular(iconStyle!.borderRadius!),
          ),
          padding: EdgeInsets.all(5),
          child: Icon(
            icons,
            size: iconStyle!.iconSize,
            color: iconStyle!.iconsColor,
          ),
        );
      } else {
        iconWidget = Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            icons,
            size: iconStyle!.iconSize,
          ),
        );
      }
    } else if (iconImage != null) {
      iconWidget = Padding(
        padding: EdgeInsets.all(5),
        child: Image(
          image: iconImage!,
          width: iconStyle!.iconSize,
          height: iconStyle!.iconSize,
        ),
      );
    } else {
      iconWidget = Padding(
        padding: EdgeInsets.all(5),
        child: SizedBox(
          width: iconStyle!.iconSize,
          height: iconStyle!.iconSize,
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ListTile(
        onTap: onTap,
        leading: iconWidget,
        title: Text(
          title,
          style: titleStyle ?? TextStyle(fontWeight: FontWeight.bold),
          maxLines: titleMaxLine,
          overflow: titleMaxLine != null ? overflow : null,
        ),
        subtitle: (subtitle != null)
            ? Text(
                subtitle!,
                style: subtitleStyle ?? Theme.of(context).textTheme.bodyMedium!,
                maxLines: subtitleMaxLine,
                overflow:
                    subtitleMaxLine != null ? TextOverflow.ellipsis : null,
              )
            : null,
        trailing: (trailing != null)
            ? trailing
            : (onTap != null)
                ? Icon(Icons.navigate_next)
                : null,
      ),
    );
  }
}
