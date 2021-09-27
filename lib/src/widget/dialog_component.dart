part of design_system;

const double _kAvatarRadius = 46;
const double _kPadding = 30;

EdgeInsets _edgeInsetsPadding(bool hasAvatar) => EdgeInsets.only(
      top: hasAvatar ? ((_kPadding / 2) + _kAvatarRadius) : _kPadding,
      left: _kPadding,
      right: _kPadding,
      bottom: _kPadding,
    );

const List<BoxShadow> _boxShadow = [
  BoxShadow(
    color: Colors.black26,
    blurRadius: 10.0,
    offset: Offset(0.0, 10.0),
  ),
];

class DialogComponent extends StatelessWidget {
  final String? _title;
  final String? _message;
  final DialogComponentAvatarBuilder? _avatarBuilder;
  final List<DialogComponentButtonBuilder> _buttonBuilders;

  DialogComponent(
    this._title,
    this._message,
    this._avatarBuilder,
    this._buttonBuilders,
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_kPadding)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    var _avatarWidget =
        _avatarBuilder != null ? _buildDialogAvatar(context, _avatarBuilder!) : null;

    var decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(_kPadding),
      color: Theme.of(context).backgroundColor,
      boxShadow: _boxShadow,
    );

    var _content = <Widget>[];
    assert(_title != null || _message != null);
    if (_title != null) {
      _content.add(TextComponent(
        _title!,
        textAlign: TextAlign.center,
        style: TextComponentStyle.headline3,
      ));
    }
    if (_message != null) {
      if (_content.isNotEmpty) _content.add(verticalSpace20);
      _content.add(TextComponent(
        _message!,
        textAlign: TextAlign.center,
        style: TextComponentStyle.bodyText2,
      ));
    }
    if (_buttonBuilders.isNotEmpty) _content.add(verticalSpace20);
    for (var builder in _buttonBuilders) {
      _content.add(_buildDialogButton(context, builder));
    }
    var _contentWidget = Container(
      padding: _edgeInsetsPadding(_avatarWidget != null),
      constraints: BoxConstraints(minWidth: double.infinity),
      margin: EdgeInsets.only(top: _kAvatarRadius),
      decoration: decoration,
      child: Column(mainAxisSize: MainAxisSize.min, children: _content),
    );
    var _items = <Widget>[];
    _items.add(_contentWidget);
    if (_avatarWidget != null) _items.add(_avatarWidget);
    return Stack(children: _items);
  }

  Widget _buildDialogButton(BuildContext ctx, DialogComponentButtonBuilder builder) {
    return Flexible(
      child: TextButton(
        onPressed: () {
          builder.onPressed.call();
          if (builder.autoDissmiss) Navigator.pop(ctx);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(double.infinity, 48),
        ),
        child: Text(
          builder.title.toUpperCase(),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(ctx).textTheme.bodyText1,
        ),
      ),
    );
  }

  Widget _buildDialogAvatar(BuildContext ctx, DialogComponentAvatarBuilder builder) {
    return Positioned(
      left: _kPadding,
      right: _kPadding,
      child: CircleAvatar(
        radius: _kAvatarRadius,
        backgroundImage: builder.backgroundImage,
        foregroundImage: builder.foregroundImage,
        child: builder.image != null
            ? Theme(
                data: Theme.of(ctx).copyWith(
                  iconTheme: IconTheme.of(ctx).copyWith(
                    color: Theme.of(ctx).colorScheme.surface,
                  ),
                ),
                child: builder.image!,
              )
            : null,
      ),
    );
  }
}

class DialogComponentBuilder {
  String? title;
  String? message;

  final DialogComponentAvatarBuilder? avatarBuilder;
  final List<DialogComponentButtonBuilder> buttonBuilders;

  DialogComponentBuilder({
    this.title,
    this.message,
    this.avatarBuilder,
    this.buttonBuilders = const [],
  });

  DialogComponent build() {
    return DialogComponent(
      title,
      message,
      avatarBuilder,
      buttonBuilders,
    );
  }
}

class DialogComponentAvatarBuilder {
  final ImageProvider? backgroundImage;
  final ImageProvider? foregroundImage;
  final Widget? image;

  DialogComponentAvatarBuilder({
    this.backgroundImage,
    this.foregroundImage,
    this.image,
  });
}

class DialogComponentButtonBuilder {
  String title;
  VoidCallback onPressed;
  bool autoDissmiss;

  DialogComponentButtonBuilder({
    required this.title,
    required this.onPressed,
    this.autoDissmiss = true,
  });
}
