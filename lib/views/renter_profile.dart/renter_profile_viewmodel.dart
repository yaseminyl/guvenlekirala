import 'package:flutter/material.dart';
import 'package:guvenlekirala/core/base/base_viewmodel.dart';
import 'package:guvenlekirala/core/constants/hive_box_contants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RenterViewModel extends BaseViewModel {
  bool isInit = false;
  TextEditingController salaryController = TextEditingController();
  TextEditingController currentRentController = TextEditingController();
  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();
  TextEditingController aboutYoursController = TextEditingController();

  String photoPath = "";
  String gender = "";
  bool havePet = false;
  String petCount = "";
  String education = "";
  int salary = 0;
  bool haveAdditionalIncome = false;
  String additionalIncome = "";
  int currentRent = 0;
  String aboutYours = "";
  String updateDate = "";

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    salaryController = Hive.box(HiveBoxConstants.salary).get("salary", defaultValue: "") != ""
        ? TextEditingController(text: Hive.box(HiveBoxConstants.salary).get("salary").toString())
        : TextEditingController();
    currentRentController = Hive.box(HiveBoxConstants.currentRent).get("currentRent", defaultValue: "") != ""
        ? TextEditingController(text: Hive.box(HiveBoxConstants.currentRent).get("currentRent").toString())
        : TextEditingController();
    minController = Hive.box(HiveBoxConstants.min).get("min", defaultValue: "") != ""
        ? TextEditingController(text: Hive.box(HiveBoxConstants.min).get("min").toString())
        : TextEditingController();
    maxController = Hive.box(HiveBoxConstants.max).get("max", defaultValue: "") != ""
        ? TextEditingController(text: Hive.box(HiveBoxConstants.max).get("max").toString())
        : TextEditingController();
    aboutYoursController = Hive.box(HiveBoxConstants.aboutYours).get("aboutYours", defaultValue: "") != ""
        ? TextEditingController(text: Hive.box(HiveBoxConstants.aboutYours).get("aboutYours").toString())
        : TextEditingController();

    photoPath = Hive.box(HiveBoxConstants.photoPath).get("photoPath", defaultValue: "");
    gender = Hive.box(HiveBoxConstants.gender).get("gender", defaultValue: "");
    havePet = Hive.box(HiveBoxConstants.havePet).get("havePet", defaultValue: false);
    petCount = Hive.box(HiveBoxConstants.petCount).get("petCount", defaultValue: "");
    education = Hive.box(HiveBoxConstants.education).get("education", defaultValue: "");
    salary = Hive.box(HiveBoxConstants.salary).get("salary", defaultValue: 0);
    haveAdditionalIncome = Hive.box(HiveBoxConstants.haveIncome).get("haveIncome", defaultValue: false);
    additionalIncome = Hive.box(HiveBoxConstants.income).get("income", defaultValue: "");
    currentRent = Hive.box(HiveBoxConstants.currentRent).get("currentRent", defaultValue: 0);
    aboutYours = Hive.box(HiveBoxConstants.aboutYours).get("aboutYours", defaultValue: "");
    updateDate = Hive.box(HiveBoxConstants.updateDate).get("updateDate", defaultValue: "");

    if (!isInit) {
      changeStatus();
      isInit = !isInit;
    }
  }

  setPhoto(String selectPath) {
    photoPath = selectPath;
    notifyListeners();
  }

  setGender(String selectGender) {
    gender = selectGender;
    notifyListeners();
  }

  setHavePet(bool pet) {
    havePet = pet;
    notifyListeners();
  }

  setPetUnit(String petUnit) {
    petCount = petUnit;
    notifyListeners();
  }

  setEducation(String educationInfo) {
    education = educationInfo;
    notifyListeners();
  }

  setSalary(int salaryInfo) {
    salary = salaryInfo;
    notifyListeners();
  }

  setHaveAdditionalIncome(bool haveIncome) {
    haveAdditionalIncome = haveIncome;
    notifyListeners();
  }

  setAdditionalIncome(String additionalIncomeInfo) {
    additionalIncome = additionalIncomeInfo;
    notifyListeners();
  }

  setCurrentRent(int rent) {
    currentRent = rent;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  setMinMaxValue(double min, double max) {
    minController.text = min.toInt().toString();
    maxController.text = max.toInt().toString();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  setAboutYours(String about) {
    aboutYours = about;
    notifyListeners();
  }

  saveProfile(
    String photoPath,
    String gender,
    bool havePet,
    String petCount,
    String education,
    int salary,
    bool haveIncome,
    String income,
    int currentRent,
    int min,
    int max,
    String aboutYours,
    String updateDate,
  ) {
    Hive.box(HiveBoxConstants.photoPath).put("photoPath", photoPath);
    Hive.box(HiveBoxConstants.gender).put("gender", gender);
    Hive.box(HiveBoxConstants.havePet).put("havePet", havePet);
    Hive.box(HiveBoxConstants.petCount).put("petCount", petCount);
    Hive.box(HiveBoxConstants.education).put("education", education);
    Hive.box(HiveBoxConstants.salary).put("salary", salary);
    Hive.box(HiveBoxConstants.haveIncome).put("haveIncome", haveIncome);
    Hive.box(HiveBoxConstants.income).put("income", income);
    Hive.box(HiveBoxConstants.currentRent).put("currentRent", currentRent);
    Hive.box(HiveBoxConstants.min).put("min", min);
    Hive.box(HiveBoxConstants.max).put("max", max);
    Hive.box(HiveBoxConstants.aboutYours).put("aboutYours", aboutYours);
    Hive.box(HiveBoxConstants.updateDate).put("updateDate", updateDate);
  }
}
