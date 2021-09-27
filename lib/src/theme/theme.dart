part of design_system;

ThemeData lightThemeData(BuildContext ctx, ColorsProvider provider) {
  return ThemeData.light().copyWith(
    primaryColor: provider.primary_color_light,
    primaryColorLight: provider.primary_color_light,
    primaryColorDark: provider.primary_color_light,
    accentColor: provider.accent_color_light,
    scaffoldBackgroundColor: provider.background_light,
    backgroundColor: provider.background_light,
    canvasColor: Colors.transparent,
    hintColor: provider.primary_color_light.withOpacity(0.54),
    errorColor: provider.error_text_light,
    colorScheme: ColorScheme.light().copyWith(
      primary: provider.primary_color_light,
      secondary: provider.accent_color_light,
      background: provider.background_light,
    ),
    textTheme: buildTextTheme(ctx, provider.primary_text_light),
    primaryTextTheme: buildTextTheme(ctx, provider.primary_text_light),
    accentTextTheme: buildTextTheme(ctx, provider.accent_color_light),
    secondaryHeaderColor: provider.secondary_text_light,
    iconTheme: buildIconTheme(ctx, provider.primary_text_light),
    primaryIconTheme: buildIconTheme(ctx, provider.primary_text_light),
    accentIconTheme: buildIconTheme(ctx, provider.accent_color_light),
  );
}

ThemeData darkThemeData(BuildContext ctx, ColorsProvider provider) {
  return ThemeData.dark().copyWith(
    primaryColor: provider.primary_text_dark,
    primaryColorLight: provider.primary_color_dark,
    primaryColorDark: provider.primary_color_dark,
    scaffoldBackgroundColor: provider.background_dark,
    backgroundColor: provider.background_dark,
    canvasColor: Colors.transparent,
    hintColor: provider.primary_color_dark.withOpacity(0.54),
    errorColor: provider.error_text_dark,
    colorScheme: ColorScheme.dark().copyWith(
      primary: provider.primary_color_dark,
      secondary: provider.accent_color_dark,
      background: provider.background_dark,
    ),
    textTheme: buildTextTheme(ctx, provider.primary_text_dark),
    primaryTextTheme: buildTextTheme(ctx, provider.primary_text_dark),
    secondaryHeaderColor: provider.secondary_text_dark,
    accentTextTheme: buildTextTheme(ctx, provider.accent_color_dark),
    iconTheme: buildIconTheme(ctx, provider.primary_text_dark),
    primaryIconTheme: buildIconTheme(ctx, provider.primary_text_dark),
    accentIconTheme: buildIconTheme(ctx, provider.accent_color_dark),
  );
}
