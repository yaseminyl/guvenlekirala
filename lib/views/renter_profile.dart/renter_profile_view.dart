import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guvenlekirala/core/components/global_widgets/custom_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:guvenlekirala/core/base/base_view.dart';
import 'package:guvenlekirala/core/constants/app_constants.dart';
import 'package:guvenlekirala/views/renter_profile.dart/renter_profile_viewmodel.dart';
import 'package:guvenlekirala/views/renter_profile.dart/renter_profile_widgets.dart';

import '../../core/components/global_widgets/custom_appbar.dart';

class RenterView extends StatelessWidget {
  const RenterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RenterViewModel>(
      viewModel: Provider.of<RenterViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      pageBuilder: (context, viewModel, _) => Scaffold(
        appBar: const CustomAppBar(
          showAppBar: true,
          title: "Kendini İfade Et!",
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus!.unfocus();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.appPagePadding,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PhotoSelection(),
                    GenderSelection(gender: viewModel.gender),
                    PetWidget(petCount: viewModel.petCount),
                    const EducationInformation(),
                    MonthlySalary(textEditingController: viewModel.salaryController),
                    AdditionalIncome(haveIncome: viewModel.haveAdditionalIncome),
                    CurrentRent(textEditingController: viewModel.currentRentController),
                    RentRangeSlider(
                      minController: viewModel.minController,
                      maxController: viewModel.maxController,
                    ),
                    AboutYours(textEditingController: viewModel.aboutYoursController),
                    viewModel.updateDate != ""
                        ? Text(
                            viewModel.updateDate != "" ? "${DateFormat('dd.MM.yyyy').format(DateTime.parse(viewModel.updateDate))} tarihinde güncellendi." : "",
                            style: Theme.of(context).textTheme.headline6,
                          )
                        : Container(),
                    SizedBox(height: 20.h),
                    CustomButton(
                      width: 160.w,
                      widget: Text(
                        "Kaydet",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      onPressed: () {
                        viewModel.saveProfile(
                          viewModel.photoPath,
                          viewModel.gender,
                          viewModel.havePet,
                          viewModel.petCount,
                          viewModel.education,
                          viewModel.salary,
                          viewModel.haveAdditionalIncome,
                          viewModel.additionalIncome,
                          viewModel.currentRent,
                          int.parse(viewModel.minController.text),
                          int.parse(viewModel.maxController.text),
                          viewModel.aboutYours,
                          DateTime.now().toIso8601String(),
                        );
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
