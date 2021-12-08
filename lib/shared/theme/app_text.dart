import 'package:flutter/material.dart';
import 'app_theme.dart';

extension TextExt on Text {
  Text get label => Text(
        // 99.9% das vezes o Lint pode estar certo, mas não nessa abaixo. O uso do This foi necessário nesse caso.
        // ignore: unnecessary_this
        this.data!,
        style: AppTheme.textStyles.label,
      );
}
