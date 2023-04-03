import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guvenlekirala/core/constants/assets_constants.dart';
import 'package:guvenlekirala/views/income_selection/income_selection_view.dart';
import 'package:provider/provider.dart';

import 'package:guvenlekirala/core/components/global_widgets/custom_button.dart';
import 'package:guvenlekirala/core/components/global_widgets/custom_textfield.dart';
import 'package:guvenlekirala/views/education_selection/education_selection_view.dart';
import 'package:guvenlekirala/views/renter_profile.dart/renter_profile_viewmodel.dart';

import '../../core/constants/color_constants.dart';

Widget headWidget(BuildContext context, String text) => Text(
      text,
      style: Theme.of(context).textTheme.headline2,
    );

class PhotoSelection extends StatelessWidget {
  const PhotoSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        // Photo View
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              height: 120.h,
              width: 120.h,
              decoration: BoxDecoration(
                color: Provider.of<RenterViewModel>(context).photoPath != "" ? ColorConstants.instance.zumthor : const Color.fromRGBO(0, 0, 0, 0.2),
                borderRadius: BorderRadius.circular(10.sp),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(0, 0, 0, 0.16),
                    offset: Offset(0, 3.sp),
                    blurRadius: 3.sp,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Container(
                margin: EdgeInsets.all(20.h),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Provider.of<RenterViewModel>(context).photoPath != ""
                      ? Image.asset(Provider.of<RenterViewModel>(context).photoPath)
                      : FaIcon(
                          FontAwesomeIcons.userLarge,
                          color: ColorConstants.instance.white.withOpacity(0.5),
                          size: 41.h,
                        ),
                ),
              ),
            ),
            Visibility(
              visible: Provider.of<RenterViewModel>(context).photoPath != "",
              child: GestureDetector(
                onTap: () {
                  Provider.of<RenterViewModel>(context, listen: false).setPhoto("");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.instance.gray,
                    borderRadius: BorderRadius.circular(5.sp),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromRGBO(0, 0, 0, 0.16),
                        offset: Offset(0, 3.sp),
                        blurRadius: 3.sp,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(5.h),
                  margin: EdgeInsets.all(5.h),
                  child: FaIcon(
                    FontAwesomeIcons.trashCan,
                    size: 10.h,
                  ),
                ),
              ),
            ),
          ],
        ),
        // Text
        SizedBox(height: 23.h),
        headWidget(context, "Profil Fotoğrafı"),
        SizedBox(height: 9.h),
        Text(
          "Aydınlık ve belirgin bir profil fotoğrafı, başvurunuzu öne çıkarmak için oldukça önemlidir. :)",
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(height: 21.h),
        // Add Photo Button
        CustomButton(
          width: 100.w,
          color: Colors.white,
          borderColor: Theme.of(context).primaryColor,
          widget: Text(
            "Ekle",
            style: Theme.of(context).textTheme.headline4,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: ColorConstants.instance.white,
                  content: SizedBox(
                    height: 200.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Provider.of<RenterViewModel>(context, listen: false).setPhoto(
                              AssetPath.profile1,
                            );
                            Navigator.of(context).pop();
                          },
                          child: Image.asset(
                            AssetPath.profile1,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class GenderSelection extends StatefulWidget {
  const GenderSelection({
    Key? key,
    required this.gender,
  }) : super(key: key);

  final String gender;

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  int? selectedIndex;
  List<String> genderList = [
    "Kadın",
    "Erkek",
    "Diğer",
  ];

  @override
  void initState() {
    for (var i = 0; i < genderList.length; i++) {
      if (genderList[i] == widget.gender) {
        selectedIndex = i;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h),
        headWidget(context, "Cinsiyetiniz"),
        SizedBox(height: 21.h),
        ListView.separated(
          itemCount: genderList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return CustomButton(
              width: MediaQuery.of(context).size.width,
              color: selectedIndex == index ? Theme.of(context).primaryColor.withOpacity(0.25) : Colors.white,
              borderColor: selectedIndex == index ? Theme.of(context).primaryColor : ColorConstants.instance.gray,
              widget: Text(
                genderList[index],
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: selectedIndex == index ? Theme.of(context).primaryColor : ColorConstants.instance.gray),
              ),
              onPressed: () {
                selectedIndex = index;
                Provider.of<RenterViewModel>(context, listen: false).setGender(genderList[selectedIndex!]);
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10.h);
          },
        ),
      ],
    );
  }
}

class PetWidget extends StatefulWidget {
  const PetWidget({
    Key? key,
    required this.petCount,
  }) : super(key: key);

  final String petCount;

  @override
  State<PetWidget> createState() => _PetWidgetState();
}

class _PetWidgetState extends State<PetWidget> {
  int? selectedIndex;

  List<String> choiceList = [
    "Evet",
    "Hayır",
  ];

  List<String> unitList = [
    "1",
    "2",
    "3+",
  ];

  @override
  void initState() {
    for (var i = 0; i < unitList.length; i++) {
      if (unitList[i] == widget.petCount) {
        selectedIndex = i;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool _havePet = Provider.of<RenterViewModel>(context).havePet;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h),
        headWidget(context, "Pet Dostunuz Var Mı?"),
        SizedBox(height: 21.h),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                width: double.infinity,
                color: _havePet ? Theme.of(context).primaryColor.withOpacity(0.25) : Colors.white,
                borderColor: _havePet ? Theme.of(context).primaryColor : ColorConstants.instance.gray,
                widget: Text(
                  choiceList[0],
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: _havePet ? Theme.of(context).primaryColor : ColorConstants.instance.gray,
                      ),
                ),
                onPressed: () {
                  Provider.of<RenterViewModel>(context, listen: false).setHavePet(true);
                },
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: CustomButton(
                width: double.infinity,
                color: !_havePet ? Theme.of(context).primaryColor.withOpacity(0.25) : Colors.white,
                borderColor: !_havePet ? Theme.of(context).primaryColor : ColorConstants.instance.gray,
                widget: Text(
                  choiceList[1],
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: !_havePet ? Theme.of(context).primaryColor : ColorConstants.instance.gray,
                      ),
                ),
                onPressed: () {
                  Provider.of<RenterViewModel>(context, listen: false).setHavePet(false);
                },
              ),
            ),
          ],
        ),
        Visibility(
          visible: _havePet,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              headWidget(context, "Pet Dost Sayısı"),
              SizedBox(height: 21.h),
              ListView.separated(
                itemCount: unitList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return CustomButton(
                    width: MediaQuery.of(context).size.width,
                    color: selectedIndex == index ? Theme.of(context).primaryColor.withOpacity(0.25) : Colors.white,
                    borderColor: selectedIndex == index ? Theme.of(context).primaryColor : ColorConstants.instance.gray,
                    widget: Text(
                      unitList[index],
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: selectedIndex == index ? Theme.of(context).primaryColor : ColorConstants.instance.gray),
                    ),
                    onPressed: () {
                      selectedIndex = index;
                      Provider.of<RenterViewModel>(context, listen: false).setPetUnit(
                        unitList[selectedIndex!],
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10.h);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EducationInformation extends StatelessWidget {
  const EducationInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h),
        headWidget(context, "Eğitim Durumunuz"),
        SizedBox(height: 21.h),
        CustomButton(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          borderColor: ColorConstants.instance.gray,
          widget: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Provider.of<RenterViewModel>(context).education != "" ? Provider.of<RenterViewModel>(context).education : "Lütfen seçiniz",
                  style: Theme.of(context).textTheme.headline3,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: ColorConstants.instance.gray,
                )
              ],
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const EducationSelectionView();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class MonthlySalary extends StatelessWidget {
  final TextEditingController textEditingController;
  const MonthlySalary({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h),
        headWidget(context, "Aylık Net Maaş"),
        SizedBox(height: 21.h),
        CustomTextField(
          controller: textEditingController,
          inputType: TextInputType.number,
          hintText: "0",
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 15.sp, right: 15.w),
            child: Text(
              "TL",
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
          ),
          onChanged: (value) {
            Provider.of<RenterViewModel>(context, listen: false).setSalary(value != "" ? int.parse(value) : 0);
          },
        ),
      ],
    );
  }
}

class AdditionalIncome extends StatefulWidget {
  const AdditionalIncome({
    Key? key,
    required this.haveIncome,
  }) : super(key: key);

  final bool haveIncome;

  @override
  State<AdditionalIncome> createState() => _AdditionalIncomeState();
}

class _AdditionalIncomeState extends State<AdditionalIncome> {
  int? selectedIndex;
  List<String> choiceList = [
    "Evet",
    "Hayır",
  ];

  @override
  Widget build(BuildContext context) {
    bool _haveIncome = Provider.of<RenterViewModel>(context, listen: false).haveAdditionalIncome;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h),
        headWidget(context, "Ek Geliriniz Var Mı?"),
        SizedBox(height: 21.h),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                width: double.infinity,
                color: _haveIncome ? Theme.of(context).primaryColor.withOpacity(0.25) : Colors.white,
                borderColor: _haveIncome ? Theme.of(context).primaryColor : ColorConstants.instance.gray,
                widget: Text(
                  choiceList[0],
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: _haveIncome ? Theme.of(context).primaryColor : ColorConstants.instance.gray,
                      ),
                ),
                onPressed: () {
                  Provider.of<RenterViewModel>(context, listen: false).setHaveAdditionalIncome(true);
                },
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: CustomButton(
                width: double.infinity,
                color: !_haveIncome ? Theme.of(context).primaryColor.withOpacity(0.25) : Colors.white,
                borderColor: !_haveIncome ? Theme.of(context).primaryColor : ColorConstants.instance.gray,
                widget: Text(
                  choiceList[1],
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: !_haveIncome ? Theme.of(context).primaryColor : ColorConstants.instance.gray,
                      ),
                ),
                onPressed: () {
                  Provider.of<RenterViewModel>(context, listen: false).setHaveAdditionalIncome(false);
                },
              ),
            ),
          ],
        ),
        Visibility(
          visible: _haveIncome,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              headWidget(context, "Gelir Tipi:"),
              SizedBox(height: 21.h),
              CustomButton(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                borderColor: ColorConstants.instance.gray,
                widget: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Provider.of<RenterViewModel>(context).additionalIncome != ""
                            ? Provider.of<RenterViewModel>(context).additionalIncome
                            : "Lütfen seçiniz",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: ColorConstants.instance.gray,
                      )
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const IncomeSelectionView();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CurrentRent extends StatelessWidget {
  final TextEditingController textEditingController;
  const CurrentRent({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h),
        headWidget(context, "Mevcut Kira Miktarınız"),
        SizedBox(height: 21.h),
        CustomTextField(
          controller: textEditingController,
          inputType: TextInputType.number,
          hintText: "0",
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 15.sp, right: 15.w),
            child: Text(
              "TL",
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
          ),
          onChanged: (value) {
            Provider.of<RenterViewModel>(context, listen: false).setCurrentRent(int.parse(value));
          },
        ),
      ],
    );
  }
}

class RentRangeSlider extends StatefulWidget {
  const RentRangeSlider({
    Key? key,
    required this.minController,
    required this.maxController,
  }) : super(key: key);

  final TextEditingController minController;
  final TextEditingController maxController;

  @override
  State<RentRangeSlider> createState() => _RentRangeSliderState();
}

class _RentRangeSliderState extends State<RentRangeSlider> {
  RangeValues values = const RangeValues(0, 100000);

  @override
  void initState() {
    if (widget.minController.text != "" || widget.maxController.text != "") {
      values = RangeValues(
        widget.minController.text != "" ? double.parse(widget.minController.text) : 0,
        widget.maxController.text != "" ? double.parse(widget.maxController.text) : 100000,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        headWidget(context, "Kiralamak İstediğiniz Mülkün Fiyat Aralığı"),
        SizedBox(height: 21.h),
        SliderTheme(
          data: const SliderThemeData(),
          child: RangeSlider(
            divisions: 100000,
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: ColorConstants.instance.gray,
            min: 0,
            max: 100000,
            values: values,
            onChanged: (value) {
              values = value;
              Provider.of<RenterViewModel>(context, listen: false).setMinMaxValue(values.start, values.end);
            },
          ),
        ),
        SizedBox(height: 23.h),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "En Düşük",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(height: 9.h),
                  CustomTextField(
                    readOnly: true,
                    controller: widget.minController,
                    hintText: "0",
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(top: 15.sp, right: 15.w),
                      child: Text(
                        "TL",
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 55.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "En Yüksek",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(height: 9.h),
                  CustomTextField(
                    readOnly: true,
                    controller: widget.maxController,
                    hintText: "100000",
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(top: 15.sp, right: 15.w),
                      child: Text(
                        "TL",
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class AboutYours extends StatelessWidget {
  const AboutYours({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.headline2,
            children: <TextSpan>[
              TextSpan(
                text: "Yeni ev sahibinize biraz kendinizden bahsedin. ",
                style: Theme.of(context).textTheme.headline2,
              ),
              TextSpan(
                text: "Örn; Taşınma nedenim şudur...",
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
        SizedBox(height: 21.h),
        SizedBox(
          height: 143.h,
          child: CustomTextField(
            controller: textEditingController,
            hintText: "Merhaba, ben ailem ile beraber İstanbul'dan iş için İzmir/Karşıyaka'ya taşınıyorum. Evinizin konumu ofisime çok yakın.",
            hintStyle: Theme.of(context).textTheme.headline6,
            maxLength: 300,
            maxLines: 8,
            onChanged: (value) {
              Provider.of<RenterViewModel>(context, listen: false).setAboutYours(value);
            },
          ),
        ),
      ],
    );
  }
}
