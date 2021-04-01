import 'package:flutter/material.dart';
import 'package:flutter_app/WorldHomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constants.dart' as Constants;
import 'CountrySelect.dart';
import 'HomeScreen.dart';


void main() async {
  // Set default home.
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var currentcountry = prefs.getString(Constants.CURRENT_COUNTRYNAME);
   print(currentcountry);

  Widget _defaultHome = new countrySelectPage();

  // Get result of the login function.
  if (currentcountry != null && currentcountry != ('') && currentcountry == ('Ghana')) {
    _defaultHome = new HomeScreen();
  }
  else   if (currentcountry != null && currentcountry != ('') &&  currentcountry == ('GFN')) {
    _defaultHome = new WorldHomeScreen();
  }
  else {
    _defaultHome = new countrySelectPage();
  }

  // Run app!
  runApp(new MaterialApp(
    debugShowCheckedModeBanner:false,
    title: 'App',
    home: _defaultHome,
    routes: <String, WidgetBuilder>{
      // Set routes for using the Navigator.
      '/HomeScreen': (BuildContext context) => new HomeScreen(),
      '/WorldHomeScreen': (BuildContext context) => new WorldHomeScreen(),
      '/countrySelect': (BuildContext context) => new countrySelectPage()
    },
  ));
}