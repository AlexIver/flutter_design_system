part of design_system;

final _circularBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
);

enum TextFieldComponentClearMode {
  never,
  editing,
  always,
}

class TextFieldComponent extends StatefulWidget {
  final TextEditingController controller;
  final Key? key;
  final String? initialValue;
  final FocusNode? focusNode;
  final Widget? leading;
  final FloatingLabelBehavior floatingLabelBehavior;
  final String? labelText;
  final String? errorText;
  final bool flatLabel;
  final String placeholder;
  final bool password;
  final TextFieldComponentClearMode clearMode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final bool autofocus;
  final bool readOnly;
  final bool? showCursor;
  final bool autocorrect;
  final bool? autovalidate;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;

  TextFieldComponent({
    required this.controller,
    this.key,
    this.initialValue,
    this.leading,
    this.placeholder = '',
    this.password = false,
    this.flatLabel = false,
    this.labelText,
    this.errorText,
    this.clearMode = TextFieldComponentClearMode.never,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.readOnly = false,
    this.showCursor,
    this.autocorrect = true,
    this.autovalidate = false,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled = true,
  });

  @override
  State<StatefulWidget> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  late bool _isEmptyText;

  @override
  void initState() {
    _isEmptyText = widget.controller.text.isEmpty;
    super.initState();
  }

  void onChangedHandler(String value) {
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    var suffixWidget = _shouldShowAttachment(widget.clearMode, _isEmptyText)
        ? IconButton(
            iconSize: 24,
            splashRadius: 24,
            icon: Icon(Icons.clear, color: Theme.of(context).hintColor),
            onPressed: _clear,
            enableFeedback: false)
        : null;
    var decoration = InputDecoration(
      hintText: widget.placeholder,
      labelText: widget.flatLabel ? null : widget.labelText,
      floatingLabelBehavior: widget.floatingLabelBehavior,
      errorText: widget.errorText,
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      filled: true,
      enabled: widget.enabled ?? true,
      fillColor: Theme.of(context).primaryColor.withOpacity(0.05),
      prefixIcon: widget.leading,
      suffixIcon: suffixWidget,
      border: _circularBorder.copyWith(
        borderSide: BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.1)),
      ),
      errorBorder: _circularBorder.copyWith(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedBorder: _circularBorder.copyWith(
        borderSide: BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.5)),
      ),
      enabledBorder: _circularBorder.copyWith(
        borderSide: BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.2)),
      ),
    );

    var field = <Widget>[];
    if (widget.flatLabel) {
      field.add(Padding(
        padding: EdgeInsets.only(bottom: 5, left: 5),
        child: TextComponent(widget.labelText ?? '', style: TextComponentStyle.caption),
      ));
    }
    field.add(
      TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        decoration: decoration,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        style: Theme.of(context).textTheme.bodyText2,
        textAlign: widget.textAlign,
        textCapitalization: widget.textCapitalization,
        autofocus: widget.autofocus,
        readOnly: widget.readOnly,
        showCursor: widget.showCursor,
        obscureText: widget.password,
        autocorrect: widget.autocorrect,
        smartDashesType: widget.password ? SmartDashesType.disabled : SmartDashesType.enabled,
        smartQuotesType: widget.password ? SmartQuotesType.disabled : SmartQuotesType.enabled,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        expands: widget.expands,
        maxLength: widget.maxLength,
        onChanged: _update,
        onTap: widget.onTap,
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: widget.onFieldSubmitted,
        inputFormatters: widget.inputFormatters,
        enabled: widget.enabled,
      ),
    );
    return Material(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: field));
  }

  _clear() {
    widget.controller.clear();
    _update(widget.controller.text);
  }

  _update(String value) {
    setState(() {
      _isEmptyText = value.isEmpty;
    });
    onChangedHandler(value);
  }

  bool _shouldShowAttachment(TextFieldComponentClearMode attachment, bool isEmptyText) {
    switch (attachment) {
      case TextFieldComponentClearMode.never:
        return false;
      case TextFieldComponentClearMode.always:
        return true;
      case TextFieldComponentClearMode.editing:
        return !isEmptyText;
    }
  }
}
