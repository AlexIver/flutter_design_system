part of design_system;

enum TextComponentStyle {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  bodyText1,
  bodyText2,
  subtitle1,
  subtitle2,
  caption,
  button,
  overline
}

class TextComponent extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextComponentStyle style;
  final Color? color;

  TextComponent(this.text, {this.textAlign, this.color, this.style = TextComponentStyle.bodyText2});
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: textAlign, style: _getTextStyle(context, style, color));
  }

  TextStyle? _getTextStyle(BuildContext ctx, TextComponentStyle style, Color? color) {
    switch (style) {
      case TextComponentStyle.headline1:
        return Theme.of(ctx).textTheme.headline1?.copyWith(color: color);
      case TextComponentStyle.headline2:
        return Theme.of(ctx).textTheme.headline2?.copyWith(color: color);
      case TextComponentStyle.headline3:
        return Theme.of(ctx).textTheme.headline3?.copyWith(color: color);
      case TextComponentStyle.headline4:
        return Theme.of(ctx).textTheme.headline4?.copyWith(color: color);
      case TextComponentStyle.headline5:
        return Theme.of(ctx).textTheme.headline5?.copyWith(color: color);
      case TextComponentStyle.bodyText1:
        return Theme.of(ctx).textTheme.bodyText1?.copyWith(color: color);
      case TextComponentStyle.bodyText2:
        return Theme.of(ctx).textTheme.bodyText2?.copyWith(color: color);
      case TextComponentStyle.subtitle1:
        return Theme.of(ctx).textTheme.subtitle1?.copyWith(color: color);
      case TextComponentStyle.subtitle2:
        return Theme.of(ctx).textTheme.subtitle2?.copyWith(color: color);
      case TextComponentStyle.caption:
        return Theme.of(ctx).textTheme.caption?.copyWith(color: color);
      case TextComponentStyle.button:
        return Theme.of(ctx).textTheme.button?.copyWith(color: color);
      case TextComponentStyle.overline:
        return Theme.of(ctx).textTheme.overline?.copyWith(color: color);
    }
  }
}
