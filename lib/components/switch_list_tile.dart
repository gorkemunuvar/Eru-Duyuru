import 'package:anons/index.dart';
import 'package:flutter/material.dart';

class SwitchListTileCard extends StatefulWidget {
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
  _SwitchListTileCardState createState() => _SwitchListTileCardState();
}

class _SwitchListTileCardState extends State<SwitchListTileCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.paddingState == null
          ? EdgeInsets.symmetric(horizontal: 15.0)
          : EdgeInsets.zero,
      child: Card(
        child: _CustomSwitchListTile(
          title: widget.title,
          isSwitched: widget.isSwitched,
          onChanged: widget.onChanged,
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
        setState(() {
          value = isSwitched;
          onChanged();
        });
      },
    );
  }
}
