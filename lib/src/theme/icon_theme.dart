part of design_system;

IconThemeData buildIconTheme(BuildContext ctx, Color color) {
  return IconTheme.of(ctx).copyWith(color: color);
}
