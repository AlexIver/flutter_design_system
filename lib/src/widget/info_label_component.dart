part of design_system;

class InfoLabelComponent extends StatelessWidget {
  final String text;

  InfoLabelComponent(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 7, right: 7, bottom: 7, top: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(color: Theme.of(context).colorScheme.surface),
      ),
    );
  }
}
