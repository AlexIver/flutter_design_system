part of design_system;

class SettingOptionComponent extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final bool hasNext;
  final VoidCallback onPressed;

  SettingOptionComponent({
    required this.onPressed,
    required this.title,
    this.subtitle,
    this.icon,
    this.hasNext = false,
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
    if (hasNext) {
      row.add(SizedBox(width: 10));
      row.add(Icon(Icons.arrow_forward_ios_outlined));
    }
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        minimumSize: Size(double.infinity, 56),
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
