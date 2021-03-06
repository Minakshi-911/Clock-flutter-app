import 'package:clockapp/enums.dart';

import 'menu_info.dart';

List<MenuInfo> _menuItems = [
  MenuInfo(MenuType.clock, 
    title: 'Clock', imageSource: 'assets/clock_icon.png'),
    MenuInfo(MenuType.alarm,
    title: 'Alarm', imageSource: 'assets/alarm_icon.png'),
    MenuInfo(MenuType.timer,
    title: 'Timer', imageSource: 'assets/timer_icon.png'),
    MenuInfo(MenuType.stopwatch,
    title: 'Stopwatch', imageSource: 'assets/stopwatch_icon.png'),
];