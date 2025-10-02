import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeStateViewModel extends Notifier<bool> {

  @override
  bool build() {
   return true;
  }

  void changeStatus(bool status)
  {
    state = status;
  }


}

final themStateProvider = NotifierProvider<ThemeStateViewModel, bool>(
  ThemeStateViewModel.new,
);

