part of core_ui;

class AppIcons {
  static const String packageName = kPackageName;

  static const String _basePath = kIconsPath;

  static const String _todoIconKey = '${_basePath}todo_icon.svg';
  static const String _doneKey = '${_basePath}done.svg';
  static const String _dotKey = '${_basePath}dot.svg';
  static const String _arrowLeftKey = '${_basePath}arrow_left.svg';
  static const String _chevronDownKey = '${_basePath}chevron_down.svg';
  static const String _reloadKey = '${_basePath}reload.svg';
  static const String _plusKey = '${_basePath}plus.svg';
  static const String _checkKey = '${_basePath}check.svg';

  static const AppIcon todoIcon = AppIcon(_todoIconKey);
  static const AppIcon done = AppIcon(_doneKey);
  static const AppIcon dot = AppIcon(_dotKey);
  static const AppIcon arrowLeft = AppIcon(_arrowLeftKey);
  static const AppIcon chevronDown = AppIcon(_chevronDownKey);
  static const AppIcon reload = AppIcon(_reloadKey);
  static const AppIcon plus = AppIcon(_plusKey);
  static const AppIcon check = AppIcon(_checkKey);
}
