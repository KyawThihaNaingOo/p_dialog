import 'package:flutter/material.dart';

enum LoadingProgressDesign { Circular, Horizontal }

bool _isShowing = false;

showPDialog({@required BuildContext context, @required PDialogEE pDialogEE}) {
  try {
    showDialog(context: context, builder: (context) => pDialogEE);
    _isShowing = true;
  } catch (e) {
    _isShowing = false;
  }
}

class PDialogEE extends StatefulWidget {
  final LoadingProgressDesign design;
  final bool cancelable;
  double progress;
  final Color bgColor;
  final Color indicatorColor;
  _PDialogEEState _simpleLoadingDialogState;

  PDialogEE({
    this.design = LoadingProgressDesign.Circular,
    this.cancelable = false,
    this.progress,
    this.bgColor = Colors.lightBlue,
    this.indicatorColor = Colors.pink,
  }) {
    _simpleLoadingDialogState = _PDialogEEState();
  }

  void setDialogProgress(double progress) {
    this.progress = progress;
    if (_isShowing) {
      _simpleLoadingDialogState.setProgress(progress);
    } else {
      throw Exception('dialog show method was not called!');
    }
  }

  void onDismiss() {
    if (_isShowing) {
      try {
        _simpleLoadingDialogState.onDismiss();
        _isShowing = false;
      } catch (e) {
        _isShowing = true;
      }
    }
  }

  bool isShowing() {
    return _isShowing;
  }

  @override
  _PDialogEEState createState() {
    if (!_simpleLoadingDialogState.mounted) {
      _simpleLoadingDialogState = _PDialogEEState();
      progress = 0;
    }
    return _simpleLoadingDialogState;
  }
}

class _PDialogEEState extends State<PDialogEE> {
  BuildContext _context;
  double width = 100;
  double height = 100;

  @override
  Widget build(BuildContext context) {
    _context = context;
    if (widget.design == LoadingProgressDesign.Horizontal) {
      width = 250;
      height = 150;
    }

    return WillPopScope(
        onWillPop: () {
          if (widget.cancelable) {
            return Future.value(true);
          } else {
            print('${widget.cancelable}');
          }
        },
        child: Container(
          // backgroundColor: Colors.transparent,
          // elevation: 0.0,
          child: Center(
            child: Container(
              width: width,
              height: height,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.design == LoadingProgressDesign.Circular
                        ? _circularWidget()
                        : Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: LinearProgressIndicator(
                                backgroundColor: widget.bgColor,
                                value: widget.progress,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    widget.indicatorColor)),
                          ),
                    SizedBox(height: 20),
                    Text('Loading...')
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  onDismiss() {
    Navigator.of(_context, rootNavigator: true).pop(true);
  }

  Widget _circularWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularProgressIndicator(),
    );
  }

  void setProgress(double progress) {
    setState(() {
      progress = progress;
    });
  }
}
