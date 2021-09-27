part of design_system;

class SettingOptionSwitchComponent extends StatefulWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final bool value;
  final ValueChanged<bool>? onChanged;

  SettingOptionSwitchComponent({
    required this.title,
    this.subtitle,
    this.icon,
    this.onChanged,
    this.value = false,
  });

  @override
  State<StatefulWidget> createState() => _SettingOptionSwitchComponentState(value);
}

class _SettingOptionSwitchComponentState extends State<SettingOptionSwitchComponent> {
  bool value = false;

  _SettingOptionSwitchComponentState(value);

  @override
  Widget build(BuildContext context) {
    var row = <Widget>[];
    if (widget.icon != null) row.add(Icon(widget.icon, color: Theme.of(context).primaryColor));
    var _contentItems = <Widget>[];
    _contentItems.add(TextComponent(widget.title, style: TextComponentStyle.subtitle2));
    if (widget.subtitle != null) {
      _contentItems.add(TextComponent(
        widget.subtitle!,
        style: TextComponentStyle.bodyText2,
        color: Theme.of(context).primaryColor.withOpacity(0.54),
      ));
    }
    var switchWidget = CupertinoSwitch(
      value: value,
      activeColor: Theme.of(context).primaryColor,
      onChanged: _switch,
    );
    var content = Expanded(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _contentItems,
    ));
    row.add(SizedBox(width: 10));
    row.add(content);
    row.add(switchWidget);
    return TextButton(
      onPressed: () => _switch(!value),
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

  void _switch(bool newValue) {
    setState(() => value = newValue);
    widget.onChanged?.call(newValue);
  }
}
