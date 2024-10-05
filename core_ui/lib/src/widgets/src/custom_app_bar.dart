import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../../../core_ui.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String? title;
  final bool isShowBackButton;
  final bool automaticallyImplyLeading;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({
    this.height = kToolbarHeight,
    this.title,
    this.isShowBackButton = true,
    this.automaticallyImplyLeading = true,
    this.leading,
    this.actions,
    super.key,
  });

  static const double backIconSize = AppDimens.iconSizeMedium;
  static const double backIconPadding = AppDimens.iconPadding;
  static const double leftLeadingPadding = AppDimens.appPagesPadding;
  static const double leadingWidth = backIconSize + backIconPadding + leftLeadingPadding;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return AppBar(
      centerTitle: false,
      surfaceTintColor: colors.background,
      backgroundColor: colors.background,
      leadingWidth: isShowBackButton ? leadingWidth : leftLeadingPadding,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Text(title ?? ''),
      leading: Padding(
        padding: const EdgeInsets.only(left: leftLeadingPadding),
        child: leading ??
            (isShowBackButton
                ? AppIcons.arrowLeft(
                    padding: const EdgeInsets.all(backIconPadding),
                    size: backIconSize,
                    onTap: AppNavigator.pop,
                  )
                : const SizedBox.shrink()),
      ),
      actions: actions,
    );
  }
}
