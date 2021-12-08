import 'app_colors.dart';
import 'app_text_styles.dart';

export 'app_text.dart';

class AppTheme {
  static final AppTheme instance = AppTheme();

  final _colors = AppColors();
  static AppColors get colors => instance._colors;

  final _textStyles = AppTextStyles();
  static AppTextStyles get textStyles => instance._textStyles;
}

 // Não foi utilizado da maneira abaixo pois precisamos que o apptheme esteja disponível assim que iniciar a aplicação
  // static AppTheme? _instance;
  // static AppTheme get instance {
  //   //ignore prefer_conditional_assignment
  //   if(_instance == null){
  //     _instance = AppTheme();
  //   }
  //   return _instance!;
  // }
