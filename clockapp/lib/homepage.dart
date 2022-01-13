// ignore_for_file: prefer_const_constructors

import 'package:clockapp/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'enums.dart';
import 'menu_info.dart';

class MyHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  get menuItems => null;

  @override
  Widget build(BuildContext context) {
   var now = DateTime.now();
   var formattedTime = DateFormat('HH:mm').format(now);
   var formattedDate = DateFormat('EEE, d MMM').format(now);
   var timezoneString = now.timeZoneOffset.toString().split('.').first;
   var offsetSign = '';
   if(!timezoneString.startsWith('-')) offsetSign = '+';
   // ignore: avoid_print
   print(timezoneString);


    return Scaffold(
    backgroundColor: const Color(0xFF202F41),
    body: Row(
      children: <Widget>[
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
            .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
            .toList(),
              ),
        const VerticalDivider(
          color: Colors.white54,
          width: 1,
        ),
        Expanded(
          child: Consumer<MenuInfo>(
            builder: (BuildContext context, MenuInfo value, Widget child) {
              if(value.menuType != MenuType.clock) 
                return Container();
              return Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: const Text(
                      'Clock', 
                      style: TextStyle(
                        fontFamily: 'avenir', 
                        fontWeight: FontWeight.w700,
                        color: Colors.white, 
                        fontSize: 24),
                    ),
                  ),
                  Flexible(
                    flex: 2, 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          formattedTime, 
                          style: const TextStyle(
                            fontFamily: 'avenir', 
                            color: Colors.white, 
                            fontSize: 64),
                        ),
                        Text(
                          formattedDate, 
                          style: const TextStyle(
                            fontFamily: 'avenir',
                            fontWeight: FontWeight.w300, 
                            color: Colors.white, 
                            fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Align(
                      alignment : Alignment.center, 
                      child: ClockView(
                        size: MediaQuery.of(context).size.height / 4, 
                      ),
                    )
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Timezone', 
                          style: TextStyle(
                            fontFamily: 'avenir',
                            fontWeight: FontWeight.w500,
                            color: Colors.white, 
                            fontSize: 64
                            ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.language, 
                              color:Colors.white, 
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'UTC' + offsetSign + timezoneString,
                              style: const TextStyle(
                                fontFamily: 'avenir',
                                color: Colors.white, 
                                fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
               ],
              ), 
            );
            },
          ),
        ),
      ],
    ),
  );}

Widget buildMenuButton(MenuInfo currentMenuInfo) {
  return Consumer<MenuInfo>(
    builder: (BuildContext context, MenuInfo value, Widget child) { 
      return FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(32))
        ),
        padding: const EdgeInsets.symmetric(vertical : 16.0),
        color: currentMenuInfo.menuType == value.menuType 
          ? Color(0xFF3F3351)
          : Colors.transparent,
        onPressed: () {
          var menuInfo = Provider.of<MenuInfo>(context, listen: false);
          menuInfo.updateMenu(currentMenuInfo);
        },
        child:Column(
          children: <Widget>[
            Image.asset(
              currentMenuInfo.imageSource, 
              scale: 1.5,
            ),
            const SizedBox(height: 16),
            Text(
              currentMenuInfo.title = '',
              style: const TextStyle(
                fontFamily: 'avenir',color: Colors.white, fontSize: 14),
            )
          ],
        ),
      );
    },
  );
  }

}

mixin CustomColors {
}
 
 
