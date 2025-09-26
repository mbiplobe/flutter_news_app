import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavViewModel extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}

final bottomNavProvider = NotifierProvider<BottomNavViewModel, int>(
  BottomNavViewModel.new,
);