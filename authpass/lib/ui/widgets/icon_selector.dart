import 'package:authpass/ui/widgets/centered_icon.dart';
import 'package:authpass/utils/predefined_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kdbx/kdbx.dart';
import 'package:logging/logging.dart';

final _logger = Logger('authpass.icon_selector');

class IconSelectorDialog extends StatefulWidget {
  const IconSelectorDialog({Key key, this.initialSelection}) : super(key: key);

  final KdbxIcon initialSelection;

  @override
  _IconSelectorDialogState createState() => _IconSelectorDialogState();

  static Future<KdbxIcon> show(BuildContext context,
      {KdbxIcon initialSelection}) {
    return showDialog<KdbxIcon>(
      context: context,
      builder: (context) =>
          IconSelectorDialog(initialSelection: initialSelection),
    );
  }
}

class _IconSelectorDialogState extends State<IconSelectorDialog> {
  final _selectorKey = GlobalKey<_IconSelectorState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: IconSelector(
        key: _selectorKey,
        initialSelection: widget.initialSelection,
      ),
      actions: <Widget>[
        FlatButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: const Text('Select icon'),
          onPressed: () {
            Navigator.of(context).pop(_selectorKey.currentState._selection);
          },
        ),
      ],
    );
  }
}

class IconSelector extends StatefulWidget {
  const IconSelector({Key key, @required this.initialSelection})
      : super(key: key);

  final KdbxIcon initialSelection;

  @override
  _IconSelectorState createState() => _IconSelectorState();
}

class _IconSelectorState extends State<IconSelector> {
  KdbxIcon _selection;

  @override
  void initState() {
    super.initState();
    _selection = widget.initialSelection;
  }

  @override
  Widget build(BuildContext context) {
//    return LayoutBuilder(builder: (context, constraints) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width * 0.8;
    return SizedBox(
      width: width,
      height: mq.size.height * 0.8,
      child: GridView.count(
        crossAxisCount: width ~/ 80,
        children: <Widget>[
          ...KdbxIcon.values.map((icon) => IconSelectorIcon(
                iconData: PredefinedIcons.iconFor(icon),
                isSelected: _selection == icon,
                onTap: () {
                  _logger.fine('Selected icon $icon');
                  setState(() => _selection = icon);
                },
              )),
        ],
      ),
    );
//    });
  }
}

class IconSelectorIcon extends StatelessWidget {
  const IconSelectorIcon({
    Key key,
    this.iconData,
    this.isSelected,
    this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Ink(
      color: isSelected ? theme.primaryColorLight : null,
      child: InkWell(
        onTap: onTap,
        child: Icon(iconData, color: isSelected ? null : theme.primaryColor),
      ),
    );
  }
}

class IconSelectorFormField extends StatelessWidget {
  const IconSelectorFormField({
    Key key,
    @required this.initialValue,
    @required this.onSaved,
    this.onChanged,
  }) : super(key: key);
  final KdbxIcon initialValue;
  final void Function(KdbxIcon icon) onSaved;
  final void Function(KdbxIcon icon) onChanged;

  @override
  Widget build(BuildContext context) {
    return FormField<KdbxIcon>(
      builder: (formFieldState) {
        final theme = Theme.of(context);
        return Card(
          elevation: 8,
          child: InkWell(
            onTap: () async {
              final newIcon = await IconSelectorDialog.show(context,
                  initialSelection: formFieldState.value);
              if (newIcon != null) {
                formFieldState.didChange(newIcon);
                onChanged?.call(newIcon);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 64,
                width: 64,
                child: Align(
                  alignment: Alignment.center,
                  child: CenteredIcon(
                    icon: PredefinedIcons.iconFor(formFieldState.value),
                    size: 48,
                    color: theme.primaryColor,
                  ),
//                        child: Icon(
//                          PredefinedIcons.iconFor(widget.entry.icon.get()),
//                          size: 40,
//                          color: theme.primaryColor,
//                        ),
                ),
              ),
            ),
          ),
        );
      },
      initialValue: initialValue,
      onSaved: onSaved,
    );
  }
}
