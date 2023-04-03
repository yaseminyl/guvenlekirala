import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guvenlekirala/core/components/global_widgets/custom_appbar.dart';
import 'package:guvenlekirala/core/constants/color_constants.dart';
import 'package:guvenlekirala/views/income_selection/income_selection_viewmodel.dart';
import 'package:guvenlekirala/views/renter_profile.dart/renter_profile_viewmodel.dart';
import 'package:guvenlekirala/views/renter_profile.dart/renter_profile_widgets.dart';
import 'package:provider/provider.dart';

import '../../core/base/base_view.dart';
import '../../core/constants/app_constants.dart';

class IncomeSelectionView extends StatefulWidget {
  const IncomeSelectionView({Key? key}) : super(key: key);

  @override
  State<IncomeSelectionView> createState() => _IncomeSelectionViewState();
}

class _IncomeSelectionViewState extends State<IncomeSelectionView> {
  List<String> incomeChoiceList = [
    "Gelir Tipi 1",
    "Gelir Tipi 2",
    "Gelir Tipi 3",
    "Gelir Tipi 4",
  ];
  @override
  Widget build(BuildContext context) {
    return BaseView<IncomeSelectionViewModel>(
      viewModel: Provider.of<IncomeSelectionViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      pageBuilder: (context, viewModel, _) => Scaffold(
        appBar: const CustomAppBar(
          showAppBar: true,
          title: "",
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.appPagePadding,
            ),
            child: Column(
              children: [
                headWidget(context, "Gelir"),
                SizedBox(height: 11.h),
                Text(
                  "Gelir durumunuzu seçiniz.",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 44.h),
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: incomeChoiceList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Provider.of<RenterViewModel>(context, listen: false).setAdditionalIncome(incomeChoiceList[index]);
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 37.h,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            incomeChoiceList[index],
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: ColorConstants.instance.ebb,
                      height: 1.h,
                      thickness: 1.h,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
