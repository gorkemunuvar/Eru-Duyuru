import 'package:anons/index.dart';
import 'package:flutter/material.dart';

class SwitchListTileCard extends StatelessWidget {
  final String title;
  final bool paddingState;
  final bool isSwitched;
  final Function onChanged;

  SwitchListTileCard({
    @required this.title,
    this.paddingState,
    this.isSwitched,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingState == null
          ? EdgeInsets.symmetric(horizontal: 15.0)
          : EdgeInsets.zero,
      child: Card(
        child: _CustomSwitchListTile(
          title: title,
          isSwitched: isSwitched,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class _CustomSwitchListTile extends StatefulWidget {
  final String title;
  bool isSwitched;
  Function onChanged;

  _CustomSwitchListTile({
    this.title,
    this.isSwitched,
    this.onChanged,
  });

  @override
  __CustomSwitchListTileState createState() => __CustomSwitchListTileState(
        title: title,
        isSwitched: isSwitched,
        onChanged: onChanged,
      );
}

class __CustomSwitchListTileState extends State<_CustomSwitchListTile> {
  final String title;
  bool isSwitched;
  Function onChanged;

  __CustomSwitchListTileState({
    this.title,
    this.isSwitched,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      value: isSwitched,
      onChanged: (bool value) {
        onChanged();
      },
    );
  }
}
