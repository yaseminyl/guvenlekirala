import 'package:guvenlekirala/views/education_selection/education_selection_viewmodel.dart';
import 'package:guvenlekirala/views/income_selection/income_selection_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:guvenlekirala/views/renter_profile.dart/renter_profile_viewmodel.dart';
import '../../../views/home/home_viewmodel.dart';

class ProviderManager {
  static ProviderManager? _instance;
  static ProviderManager get instance {
    _instance ??= ProviderManager._init();
    return _instance!;
  }

  ProviderManager._init();

  List<SingleChildWidget> singleProvider = [
    ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
    ),
    ChangeNotifierProvider<RenterViewModel>(
      create: (_) => RenterViewModel(),
    ),
    ChangeNotifierProvider<EducationSelectionViewModel>(
      create: (_) => EducationSelectionViewModel(),
    ),
    ChangeNotifierProvider<IncomeSelectionViewModel>(
      create: (_) => IncomeSelectionViewModel(),
    ),
  ];
}
