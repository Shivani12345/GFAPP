import 'package:flutter/material.dart';

const String HOME = "Home";
const String SUCCESS_MESSAGE = " You will be contacted by us very soon.";
const String IDENTIFY_VICTIM = "Identifying victims";
const String HOW_TOHELP = "How to help";
const String KNOW_THELAW = "Know the law";
const String ABOUT_THISAPP = "About this app";
const String AFRICA_SIGNING = "GFN Africa Signing";
const String ABOUT_GFN = "About GFN";
const String ABOUT_WALKFREE = "About Walk Free";
const String ABOUT_GSI = "About GSI";
const String PREFERENCES = "Preferences";


const String ABOUT_HUMAN_TRAFFIC = "About Human Trafficking";
const String ABOUT_MODERN_SLAVERY = "About Modern Slavery";
const String ROLEOF_FAITH = "Role of faith";
const String HOW_TOTALK_CONGREGATION = "How to talk to your congregations";
const String TALKING_YOUR_CONGREGATION = "Talking to your congregations";
const String PRAYERS = "Prayers";




const String CURRENT_COUNTRYID = "currentId";
const String CURRENT_COUNTRYNAME = "currentCountry";
const String GHANA = "Ghana";
const String WORLD = "World";
const String GFN = "GFN";
const String ITALY = "Italy";
const String GFN_PLEDGE =   "GFN Pledge" ;//"Disclosure";
const String GFN_SIGNING =   "GFN Signings" ;

const String ITALY_LOADERTEXT = "FOR ITALIAN FAITH LEADERS \nFIGHTING HUMAN TRAFFICKING";
const String GHANA_LOADERTEXT = "FOR GHANAIAN FAITH LEADERS \nFIGHTING HUMAN TRAFFICKING";
const String WORLD_LOADERTEXT = "FOR WORLD FAITH LEADERS \nFIGHTING HUMAN TRAFFICKING";

Color myHexColor = HexColor("#000028");
Color myHexYellowColor = HexColor("#ffdc00");
Color whiteColor = HexColor("#ffffff");
Color blackColor = HexColor("#000000");
Color grayColor = HexColor("#e8e8e8");

class Constants {}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
