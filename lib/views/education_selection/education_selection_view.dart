import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guvenlekirala/core/components/global_widgets/custom_appbar.dart';
import 'package:guvenlekirala/core/constants/color_constants.dart';
import 'package:guvenlekirala/views/education_selection/education_selection_viewmodel.dart';
import 'package:guvenlekirala/views/renter_profile.dart/renter_profile_viewmodel.dart';
import 'package:guvenlekirala/views/renter_profile.dart/renter_profile_widgets.dart';
import 'package:provider/provider.dart';

import '../../core/base/base_view.dart';
import '../../core/constants/app_constants.dart';

class EducationSelectionView extends StatefulWidget {
  const EducationSelectionView({Key? key}) : super(key: key);

  @override
  State<EducationSelectionView> createState() => _EducationSelectionViewState();
}

class _EducationSelectionViewState extends State<EducationSelectionView> {
  List<String> educationChoiceList = [
    "Doktora",
    "İlkokul",
    "Lise",
    "Üniversite",
  ];
  @override
  Widget build(BuildContext context) {
    return BaseView<EducationSelectionViewModel>(
      viewModel: Provider.of<EducationSelectionViewModel>(context, listen: false),
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
                headWidget(context, "Eğitim Durumunuz"),
                SizedBox(height: 11.h),
                Text(
                  "Eğitim durumunuzu seçiniz.",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 44.h),
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: educationChoiceList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Provider.of<RenterViewModel>(context, listen: false).setEducation(educationChoiceList[index]);
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 37.h,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            educationChoiceList[index],
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
