import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:time_tracker/widgets/platform_widget.dart';

class PlatFormAlertDialog extends PlatFormWidget {
  PlatFormAlertDialog({
    @override this.title,
    @override this.content,
    @override this.defaultActionText,
  })  : assert(title != null),
        assert(content != null),
        assert(defaultActionText != null);

  final String title;
  final String content;
  final String defaultActionText;

  Future<bool> show(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => this,
    );
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
      ),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      PlatFormAlertDialogAction(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(defaultActionText),
      )
    ];
  }
}

class PlatFormAlertDialogAction extends PlatFormWidget {
  final Widget child;
  final VoidCallback onPressed;

  PlatFormAlertDialogAction({
    this.child,
    this.onPressed,
  });

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: child,
    );
  }
}
