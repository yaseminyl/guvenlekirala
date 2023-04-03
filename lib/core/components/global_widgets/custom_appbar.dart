import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guvenlekirala/core/constants/color_constants.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title, required this.showAppBar}) : super(key: key);

  final String? title;
  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: title != null ? true : false,
      leading: title != null
          ? InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: ColorConstants.instance.thunder,
                  size: 15.w,
                ),
              ),
            )
          : const SizedBox(),
      elevation: 0,
      title: title != null
          ? Text(
              title!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            )
          : const SizedBox(),
      centerTitle: true,
      toolbarHeight: 40.h,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.h);
}
