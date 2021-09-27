part of design_system;

enum ButtonComponentSize { small, medium, large }

enum ButtonComponentWidthSize { normal, wide }

class ButtonComponent extends StatelessWidget {
  final String title;
  final bool busy;
  final ButtonComponentSize size;
  final ButtonComponentWidthSize widthSize;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;

  ButtonComponent({
    Key? key,
    required this.title,
    this.busy = false,
    this.size = ButtonComponentSize.medium,
    this.widthSize = ButtonComponentWidthSize.normal,
    this.onTap,
    this.leading,
  })  : outline = false,
        super(key: key);

  const ButtonComponent.outline({
    required this.title,
    this.onTap,
    this.leading,
    this.size = ButtonComponentSize.medium,
    this.widthSize = ButtonComponentWidthSize.normal,
  })  : busy = false,
        outline = true;

  @override
  Widget build(BuildContext context) {
    var textStyle = outline ? Theme.of(context).textTheme.button : null;
    var leadingWidget = leading != null
        ? (outline ? Theme(data: Theme.of(context).copyWith(), child: leading!) : leading!)
        : null;
    var buttonContent = busy
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: _getButtonHeight(size) - 20,
              width: _getButtonHeight(size) - 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(Theme.of(context).colorScheme.surface),
              ),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leadingWidget != null) leadingWidget,
              if (leading != null) SizedBox(width: 5),
              Flexible(
                  child: Text(
                title,
                style: textStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
            ],
          );

    var style = outline
        ? ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            onPrimary: Theme.of(context).colorScheme.primary,
            minimumSize: Size(_getButtonWidth(widthSize), _getButtonHeight(size)),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
            ),
          )
        : (busy
            ? ElevatedButton.styleFrom(
                onPrimary: Theme.of(context).colorScheme.primary,
                shadowColor: Colors.transparent,
                minimumSize: Size(_getButtonWidth(widthSize), _getButtonHeight(size)),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              )
            : ElevatedButton.styleFrom(
                minimumSize: Size(_getButtonWidth(widthSize), _getButtonHeight(size)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ));
    return ElevatedButton(
      onPressed: busy ? () {} : onTap,
      style: style,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        child: buttonContent,
      ),
    );
  }

  double _getButtonHeight(ButtonComponentSize size) {
    switch (size) {
      case ButtonComponentSize.small:
        return 40;
      case ButtonComponentSize.medium:
        return 48;
      case ButtonComponentSize.large:
        return 56;
    }
  }

  double _getButtonWidth(ButtonComponentWidthSize size) {
    switch (size) {
      case ButtonComponentWidthSize.normal:
        return 0;
      case ButtonComponentWidthSize.wide:
        return double.infinity;
    }
  }
}
