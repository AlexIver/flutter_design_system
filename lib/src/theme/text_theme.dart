part of design_system;

TextTheme buildTextTheme(BuildContext ctx, Color color) {
  return GoogleFonts.latoTextTheme(
    Theme.of(ctx).textTheme.copyWith(
          headline1: headline1(color),
          headline2: headline2(color),
          headline3: headline3(color),
          headline4: headline4(color),
          headline5: headline5(color),
          bodyText1: bodyText1(color),
          bodyText2: bodyText2(color),
          subtitle1: subtitle1(color),
          subtitle2: subtitle2(color),
          caption: caption(color),
          button: button(color),
          overline: overline(color),
        ),
  );
}
