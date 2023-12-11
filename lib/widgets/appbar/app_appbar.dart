import 'package:flutter/material.dart';
import 'package:intertech/core/theme/app_text_styles.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar(
      {super.key,
      this.title,
      this.actions,
      this.hasBackButton = false,
      this.showElevation,
      this.appbarHeight});

  final String? title;
  final List<Widget>? actions;
  final bool hasBackButton;
  final bool? showElevation;
  final double? appbarHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: showElevation == false ? 0 : 5,
      shadowColor: const Color.fromRGBO(34, 41, 67, 0.05),
      centerTitle: true,
      actions: actions,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      surfaceTintColor: Colors.white,
      title: Text(
        title == null ? "" : title!,
        style: AppTextStyles.shared.appbarTextStyle,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appbarHeight ?? 50);
}
