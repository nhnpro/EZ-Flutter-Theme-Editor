import 'BlocProvider.dart';
import 'ThemeUpdateBloc.dart';

class GlobalBloc implements BlocBase {
  ThemeUpdateBloc themeUpdateBloc;

  GlobalBloc() {
    themeUpdateBloc = ThemeUpdateBloc();
  }

  void dispose() {
    themeUpdateBloc.dispose();
  }
}