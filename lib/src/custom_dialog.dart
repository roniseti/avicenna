import 'dart:async';
import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'values.dart';

class AvicennaDialog extends StatelessWidget {
  const AvicennaDialog({
    Key? key,
    this.image,
    this.title,
    this.info,
    this.content,
    this.actions = const [],
    this.insetPadding = const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
  }) : super(key: key);

  final Widget? image;
  final String? title;
  final String? info;
  final Widget? content;
  final List<AvicennaDialogActionItem> actions;
  final EdgeInsets insetPadding;

  @override
  Widget build(BuildContext context) {
    var radius = 12.0;
    return AlertDialog(
      title: Column(
        children: [
          image ?? const SizedBox(height: 12),
          Text(title ?? '', textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          SizedBox(height: info != null ? 18 : 0),
          Text(info ?? '', style: const TextStyle(fontSize: 14, color: AvicennaColors.secondBlack), textAlign: TextAlign.center),
          SizedBox(height: content == null ? 12 : 0)
        ],
      ),
      insetPadding: insetPadding,
      content: content,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      // actions: actions != null ? [
      //   for (var i = 0; i < actions!.length; i++)
      //     modalAction(
      //       actions![i].text,
      //       actions![i].onPressed,
      //       MediaQuery.of(context).size.width,
      //       radius,
      //       i == actions!.length - 1,
      //       actions![i].isDestructive
      //     )
      // ] : [],
      actions: actions.length > 4 ?
      [
      Column(
        children: [
          SizedBox(
            height: 180,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var i = 0; i < actions.length -1 ; i++) ...[
                    // modalAction(
                    //   actions[i].text,
                    //   actions[i].child,
                    //   actions[i].onPressed,
                    //   MediaQuery.of(context).size.width,
                    //   radius,
                    //   i == actions.length - 1,
                    //   actions[i].isDestructive,
                    //   actions[i].withTopBorder
                    // ),
                    const SizedBox(height: 1),
                    const Divider(height: 0, thickness: 1),
                    ModalAction(
                      text: actions[i].text,
                      width: MediaQuery.of(context).size.width,
                      onPressed: actions[i].onPressed,
                      radius: radius,
                      last: i == actions.length - 1,
                      isDestructive: actions[i].isDestructive,
                      withTopBorder: actions[i].withTopBorder,
                      child: actions[i].child,
                      // child: Text(actions[i].text,
                      //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: actions[i].isDestructive ? AvicennaColors.danger : Colors.black)
                      // ),
                    ),
                  ]
                ],
              )
            )
          ),
          const Divider(height: 0, thickness: 1),
          ModalAction(
            text: actions[actions.length -1].text,
            width: MediaQuery.of(context).size.width,
            onPressed: actions[actions.length -1].onPressed,
            radius: radius,
            last: actions.length -1 == actions.length - 1,
            isDestructive: actions[actions.length -1].isDestructive,
            withTopBorder: actions[actions.length -1].withTopBorder,
            child: actions[actions.length -1].child,
            // child: Text(actions[actions.length -1].text,
            //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: actions[actions.length -1].isDestructive ? AvicennaColors.danger : Colors.black)
            // ),
          ),
        ],
      )
      // for (var i = 0; i < actions!.length; i++)
      //   modalAction(
      //     actions![i].text,
      //     actions![i].onPressed,
      //     MediaQuery.of(context).size.width,
      //     radius,
      //     i == actions!.length - 1,
      //     actions![i].isDestructive
      //   )
      ] : [
        for (var i = 0; i < actions.length; i++) ...[
          const Divider(height: 0, thickness: 1),
          // Row(children: [
          // CupertinoButton(
          //   color: Colors.white,
          //   child: Text(actions![i].text, style: TextStyle(
          //       color: actions![i].isDestructive ? Colors.red : Colors.black
          //   )),
          //   onPressed: (){},
          //   borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(radius),
          //     bottomRight: Radius.circular(radius)
          //   ),
          // )]),]
          // modalAction(
          //   actions![i].text,
          //   actions![i].child,
          //   actions![i].onPressed,
          //   MediaQuery.of(context).size.width,
          //   radius,
          //   i == actions!.length - 1,
          //   actions![i].isDestructive,
          //   actions![i].withTopBorder
          // )
          ModalAction(
            text: actions[i].text,
            width: MediaQuery.of(context).size.width,
            onPressed: actions[i].onPressed,
            radius: radius,
            last: i == actions.length - 1,
            isDestructive: actions[i].isDestructive,
            withTopBorder: actions[i].withTopBorder,
            child: actions[i].child,
            // child: Text(actions[i].text,
            //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: actions[i].isDestructive ? AvicennaColors.danger : Colors.black)
            // ),
          ),
        ]
      ],
      buttonPadding: const EdgeInsets.all(0),
    );
  }

  // Widget modalAction(String text, Widget? child, Function()? onPressed, double width, double radius,bool last, bool isDestructive, bool withTopBorder) {
  //   return Material(
  //     color: Colors.white,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(last ? radius : 0), bottomRight: Radius.circular(last ? radius : 0)),
  //     ),
  //     child: InkWell(
  //       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(last ? radius : 0), bottomRight: Radius.circular(last ? radius : 0)),
  //       onTap: onPressed,
  //       child: Column(
  //         children: [
  //           // Divider(height: 0, thickness: 1),
  //           Container(
  //             width: width,
  //             decoration: BoxDecoration(
  //               border: Border(
  //                 top: BorderSide(
  //                   color: withTopBorder ? AvicennaColors.disabledButton : Colors.transparent,
  //                   width: withTopBorder ? 1 : 0
  //                 )
  //               )
  //             ),
  //             padding: const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
  //             child: Center(
  //               child: child ?? Text(text,
  //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: isDestructive ? AvicennaColors.danger : Colors.black)
  //               )
  //             )
  //           ),
  //         ],
  //       )
  //     ),
  //   );
  //   // return GestureDetector(
  //   //   behavior: HitTestBehavior.opaque,
  //   //   // onTapDown: enabled ? _handleTapDown : null,
  //   //   // onTapUp: enabled ? _handleTapUp : null,
  //   //   // onTapCancel: enabled ? _handleTapCancel : null,
  //   //   onTap: onPressed,
  //   //   child: Semantics(
  //   //     button: true,
  //   //     child:
  //   //     // ConstrainedBox(
  //   //     //   constraints: widget.minSize == null
  //   //     //       ? const BoxConstraints()
  //   //     //       : BoxConstraints(
  //   //     //     minWidth: widget.minSize!,
  //   //     //     minHeight: widget.minSize!,
  //   //     //   ),
  //   //     //   child:
  //   //       FadeTransition(
  //   //         opacity: _opacityAnimation,
  //   //         child: DecoratedBox(
  //   //           decoration: BoxDecoration(
  //   //             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(last ? radius : 0), bottomRight: Radius.circular(last ? radius : 0)),
  //   //             // color: backgroundColor != null && !enabled
  //   //             //     ? CupertinoDynamicColor.resolve(widget.disabledColor, context)
  //   //             //     : backgroundColor,
  //   //           ),
  //   //           child: Padding(
  //   //             padding: const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24), //widget.padding ?? (backgroundColor != null
  //   //                 // ? _kBackgroundButtonPadding
  //   //                 // : _kButtonPadding),
  //   //             child: Align(
  //   //               // alignment: widget.alignment,
  //   //               widthFactor: 1.0,
  //   //               heightFactor: 1.0,
  //   //               child:
  //   //               // DefaultTextStyle(
  //   //               //   style: textStyle,
  //   //               //   child: IconTheme(
  //   //               //     data: IconThemeData(color: foregroundColor),
  //   //               //     child:
  //   //                   child,
  //   //                 // ),
  //   //               // ),
  //   //             ),
  //   //           ),
  //   //         ),
  //   //       ),
  //   //     ),
  //   //   // ),
  //   // );
  // }

}

class ModalAction extends StatefulWidget {
  const ModalAction({
    Key? key,
    required this.text,
    this.child,
    this.onPressed,
    required this.width,
    required this.radius,
    required this.last,
    required this.isDestructive,
    required this.withTopBorder,
  }) : super(key: key);

  final String text;
  final Widget? child;
  final Function()? onPressed;
  final double width;
  final double radius;
  final bool last;
  final bool isDestructive;
  final bool withTopBorder;

  @override
  State<ModalAction> createState() => _ModalActionState();
}

class _ModalActionState extends State<ModalAction> with SingleTickerProviderStateMixin {
  static const Duration kFadeOutDuration = Duration(milliseconds: 120);
  static const Duration kFadeInDuration = Duration(milliseconds: 180);
  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );

    _opacityAnimation = _animationController
      .drive(CurveTween(curve: Curves.decelerate))
      .drive(_opacityTween);
    
    _setTween();
  }

  void _setTween() {
    _opacityTween.end = 0.6;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) return;
    final bool wasHeldDown = _buttonHeldDown;
    final TickerFuture ticker = _buttonHeldDown
      // ? _animationController.animateTo(1.0, duration: kFadeOutDuration, curve: Curves.easeInOutCubicEmphasized)
      ? _animationController.animateTo(1.0, duration: kFadeOutDuration, curve: Curves.easeInOutCubic)
      : _animationController.animateTo(0.0, duration: kFadeInDuration, curve: Curves.easeOutCubic);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) _animate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(widget.last ? widget.radius : 0), bottomRight: Radius.circular(widget.last ? widget.radius : 0)),
        color: const Color(0xFFE0E0E0),
        // border: Border(
        //   top: BorderSide(
        //     color: widget.withTopBorder ? AvicennaColors.disabledButton : Colors.transparent,
        //     width: widget.withTopBorder ? 1 : 0
        //   )
        // )
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        onTap: widget.onPressed,
        child: Semantics(
          button: true,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              // minHeight: widget.minSize!,
              minWidth: widget.width,
            ),
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(widget.last ? widget.radius : 0), bottomRight: Radius.circular(widget.last ? widget.radius : 0)),
                  color: const Color(0xFFFFFFFF),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24), //widget.padding ?? (backgroundColor != null
                  // ? _kBackgroundButtonPadding
                  // : _kButtonPadding),
                  child: Align(
                    alignment: Alignment.center,
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child:
                    // DefaultTextStyle(
                    //   style: textStyle,
                    //   child: IconTheme(
                    //     data: IconThemeData(color: foregroundColor),
                    //     child:
                    widget.child ?? Text(widget.text,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: widget.isDestructive ? AvicennaColors.danger : Colors.black)
                    ),
                    // ),
                    // ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class AvicennaDialogActionItem {
  const AvicennaDialogActionItem({
    required this.text,
    this.child,
    this.isDestructive = false,
    required this.onPressed,
    this.withTopBorder = true,
  });

  final String text;
  final Widget? child;
  final bool isDestructive;
  final Function()? onPressed;
  final bool withTopBorder;
}

class DoubleDialog extends StatelessWidget {
  const DoubleDialog({
    Key? key,
    this.image,
    this.title,
    this.info,
    this.content,
    this.actions,
    this.insetPadding = const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
  }) : super(key: key);

  final Widget? image;
  final String? title;
  final String? info;
  final Widget? content;
  final List<AvicennaDialogActionItem>? actions;
  final EdgeInsets insetPadding;

  @override
  Widget build(BuildContext context) {
    var radius = 12.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlertDialog(
          // title: Column(
          //   children: [
          //     image ?? SizedBox(height: 12),
          //     Text(title ?? '', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          //     SizedBox(height: info != null ? 18 : 0),
          //     Text(info ?? '', style: TextStyle(fontSize: 14, color: AvicennaColors.secondBlack), textAlign: TextAlign.center),
          //     SizedBox(height: content == null ? 12 : 0)
          //   ],
          // ),
          insetPadding: insetPadding,
          content: content,
          // contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          // // actions: actions != null ? [
          // //   for (var i = 0; i < actions!.length; i++)
          // //     modalAction(
          // //       actions![i].text,
          // //       actions![i].onPressed,
          // //       MediaQuery.of(context).size.width,
          // //       radius,
          // //       i == actions!.length - 1,
          // //       actions![i].isDestructive
          // //     )
          // // ] : [],
          // actions: actions != null ? actions!.length > 4 ?
          // [
          //   Container(
          //       child: Column(
          //         children: [
          //           Container(
          //               height: 180,
          //               child: SingleChildScrollView(
          //                   child: Column(
          //                     children: [
          //                       for (var i = 0; i < actions!.length -1 ; i++)
          //                         modalAction(
          //                             actions![i].text,
          //                             actions![i].child,
          //                             actions![i].onPressed,
          //                             MediaQuery.of(context).size.width,
          //                             radius,
          //                             i == actions!.length - 1,
          //                             actions![i].isDestructive,
          //                             actions![i].withTopBorder
          //                         )
          //                     ],
          //                   )
          //               )
          //           ),
          //           modalAction(
          //               actions![actions!.length -1].text,
          //               actions![actions!.length -1].child,
          //               actions![actions!.length -1].onPressed,
          //               MediaQuery.of(context).size.width,
          //               radius,
          //               actions!.length -1 == actions!.length - 1,
          //               actions![actions!.length -1].isDestructive,
          //               actions![actions!.length -1].withTopBorder
          //           )
          //         ],
          //       )
          //   )
          //   // for (var i = 0; i < actions!.length; i++)
          //   //   modalAction(
          //   //     actions![i].text,
          //   //     actions![i].onPressed,
          //   //     MediaQuery.of(context).size.width,
          //   //     radius,
          //   //     i == actions!.length - 1,
          //   //     actions![i].isDestructive
          //   //   )
          // ] : [
          //   for (var i = 0; i < actions!.length; i++)
          //     modalAction(
          //         actions![i].text,
          //         actions![i].child,
          //         actions![i].onPressed,
          //         MediaQuery.of(context).size.width,
          //         radius,
          //         i == actions!.length - 1,
          //         actions![i].isDestructive,
          //         actions![i].withTopBorder
          //     )
          // ] : [],
          buttonPadding: const EdgeInsets.all(0),
        ),
        AlertDialog(
          title: Column(
            children: [
              image ?? const SizedBox(height: 12),
              Text(title ?? '', textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              SizedBox(height: info != null ? 18 : 0),
              Text(info ?? '', style: const TextStyle(fontSize: 14, color: AvicennaColors.secondBlack), textAlign: TextAlign.center),
              SizedBox(height: content == null ? 12 : 0)
            ],
          ),
          insetPadding: insetPadding,
          // content: content,
          contentPadding: EdgeInsets.zero,
          content: //actions != null ? actions!.length > 4 ?
          IntrinsicHeight(child:
            Column(
              children: [
                SizedBox(
                    height: 190,
                    child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var i = 0; i < actions!.length; i++)
                              modalAction(
                                actions![i].text,
                                actions![i].child,
                                actions![i].onPressed,
                                MediaQuery.of(context).size.width /3,
                                radius,
                                i == 0,
                                i == actions!.length - 1,
                                actions![i].isDestructive,
                                actions![i].withTopBorder
                              )
                          ],
                        )
                    )
                ),
                // modalAction(
                //     actions![actions!.length -1].text,
                //     actions![actions!.length -1].child,
                //     actions![actions!.length -1].onPressed,
                //     MediaQuery.of(context).size.width /3,
                //     radius,
                //     actions!.length -1 == actions!.length - 1,
                //     actions![actions!.length -1].isDestructive,
                //     actions![actions!.length -1].withTopBorder
                // )
              ],
            )
            // for (var i = 0; i < actions!.length; i++)
            //   modalAction(
            //     actions![i].text,
            //     actions![i].onPressed,
            //     MediaQuery.of(context).size.width,
            //     radius,
            //     i == actions!.length - 1,
            //     actions![i].isDestructive
            //   )
          //  : [
          //   for (var i = 0; i < actions!.length; i++)
          //     modalAction(
          //         actions![i].text,
          //         actions![i].child,
          //         actions![i].onPressed,
          //         MediaQuery.of(context).size.width,
          //         radius,
          //         i == actions!.length - 1,
          //         actions![i].isDestructive,
          //         actions![i].withTopBorder
          //     )
          // ] : [],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        )
      ] 
    );
  }

  Widget modalAction(String text, Widget? child, Function()? onPressed, double width, double radius, bool first, bool last, bool isDestructive, bool withTopBorder) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(last ? radius : 0),
          bottomRight: Radius.circular(last ? radius : 0),
          topLeft: Radius.circular(first ? radius : 0),
          topRight: Radius.circular(first ? radius : 0),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(last ? radius : 0), bottomRight: Radius.circular(last ? radius : 0)),
        onTap: onPressed,
        child: Column(
          children: [
            // Divider(height: 0, thickness: 1),
            Container(
              width: width,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: withTopBorder ? AvicennaColors.disabledButton : Colors.transparent,
                    width: withTopBorder ? 1 : 0
                  )
                )
             ),
              padding: const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
              child: Center(
                child: child ?? Text(text,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: isDestructive ? AvicennaColors.danger : Colors.black)
                )
              )
            ),
          ],
        )
      ),
    );
  }
}

class AvicennaFullScreenDialog extends StatelessWidget {
  const AvicennaFullScreenDialog({
    Key? key,
    required this.title,
    required this.content,
    this.backgroundColor = AvicennaColors.lightBackground,
  }) : super(key: key);

  final String title;
  final Widget content;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black
        ),
        // centerTitle: true,
        title: Text(title, style: const TextStyle(
            color: Colors.black
        )),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white
      ),
      body: content
    );
  }

}

void showAvicennaDialog({
  required BuildContext context,
  bool barrierDismissible = true,
  Color barrierColor = Colors.black12,
  double blur = 4.0,
  String barrierLabel = 'Dismiss',
  bool useSafeArea = true,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  required Widget child,
  Duration transitionDuration = const Duration(milliseconds: 200),
  Duration reverseTransitionDuration = const Duration(milliseconds: 100),
  FutureOr<void> Function()? whenComplete,
}) {
  showModal(
    context: context,
    configuration: FadeScaleTransitionConfiguration(
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      transitionDuration: transitionDuration,
      reverseTransitionDuration: reverseTransitionDuration
    ),
    builder: (context) {
      return barrierDismissible ?
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: child
      ) :
      WillPopScope(
        onWillPop: () async => false,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: child
        )
      );
    }
  ).whenComplete(whenComplete ?? (){});
}

Future<T?> showAvicennaDialogAsync<T>({
  required BuildContext context,
  bool barrierDismissible = true,
  Color barrierColor = Colors.black12,
  double blur = 4.0,
  String barrierLabel = 'Dismiss',
  bool useSafeArea = true,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  required Widget child,
  Duration transitionDuration = const Duration(milliseconds: 200),
  Duration reverseTransitionDuration = const Duration(milliseconds: 100),
  FutureOr<void> Function()? whenComplete,
}) async {
  return await showModal(
    context: context,
    configuration: FadeScaleTransitionConfiguration(
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      transitionDuration: transitionDuration,
      reverseTransitionDuration: reverseTransitionDuration
    ),
    builder: (context) {
      return barrierDismissible ?
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: child
      ) :
      WillPopScope(
        onWillPop: () async => false,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: child
        )
      );
    }
  ).whenComplete(whenComplete ?? (){});
}
