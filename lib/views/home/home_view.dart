import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:guvenlekirala/core/base/base_view.dart';
import 'package:guvenlekirala/core/components/global_widgets/custom_button.dart';
import 'package:guvenlekirala/core/constants/app_constants.dart';
import 'package:guvenlekirala/core/constants/assets_constants.dart';
import 'package:guvenlekirala/views/home/home_viewmodel.dart';
import 'package:guvenlekirala/views/renter_profile.dart/renter_profile_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: Provider.of<HomeViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      pageBuilder: (context, viewModel, _) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.appPagePadding,
            ),
            child: Column(
              children: [
                SizedBox(height: 150.h),
                Image.asset(
                  AssetPath.logo,
                  height: 100.h,
                ),
                SizedBox(height: 50.h),
                CustomButton(
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const RenterView();
                        },
                      ),
                    );
                  },
                  widget: Text(
                    "Kendini İfade Et!",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
