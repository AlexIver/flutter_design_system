part of design_system;

class AutoCompleteComponent extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onPressed;

  AutoCompleteComponent({
    required this.title,
    this.subtitle,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var row = <Widget>[];
    if (icon != null) row.add(Icon(icon, color: Theme.of(context).primaryColor));
    var _contentItems = <Widget>[];
    _contentItems.add(TextComponent(title, style: TextComponentStyle.subtitle2));
    if (subtitle != null) {
      _contentItems.add(TextComponent(
        subtitle!,
        style: TextComponentStyle.bodyText2,
        color: Theme.of(context).primaryColor.withOpacity(0.54),
      ));
    }
    var content = Expanded(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _contentItems,
    ));
    row.add(SizedBox(width: 10));
    row.add(content);
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: row,
        ),
      ),
    );
  }
}
