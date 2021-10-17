import 'package:flutter/material.dart';
import 'values.dart' as av;

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    this.image,
    this.title,
    this.info,
    this.content,
    this.actions,
    this.insetPadding,
  }) : super(key: key);

  final Widget? image;
  final String? title;
  final String? info;
  final Widget? content;
  final List<ModalActionItem>? actions;
  final EdgeInsets? insetPadding;

  @override
  Widget build(BuildContext context) {
    var radius = 12.0;
    return AlertDialog(
      title: Column(
        children: [
          image ?? const SizedBox(height: 12),
          Text(title ?? '', textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          SizedBox(height: info != null ? 18 : 0),
          Text(info ?? '', style: const TextStyle(fontSize: 14, color: av.Colors.secondBlack), textAlign: TextAlign.center),
          SizedBox(height: content == null ? 12 : 0)
        ],
      ),
      insetPadding: insetPadding ?? const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
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
      actions: actions != null ? actions!.length > 4 ?
      [
      Column(
        children: [
          SizedBox(
            height: 180,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var i = 0; i < actions!.length -1 ; i++)
                    modalAction(
                      actions![i].text,
                      actions![i].child,
                      actions![i].onPressed,
                      MediaQuery.of(context).size.width,
                      radius,
                      i == actions!.length - 1,
                      actions![i].isDestructive,
                      actions![i].withTopBorder
                    )
                ],
              )
            )
          ),
          modalAction(
            actions![actions!.length -1].text,
            actions![actions!.length -1].child,
            actions![actions!.length -1].onPressed,
            MediaQuery.of(context).size.width,
            radius,
            actions!.length -1 == actions!.length - 1,
            actions![actions!.length -1].isDestructive,
            actions![actions!.length -1].withTopBorder
          )
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
        for (var i = 0; i < actions!.length; i++)
          modalAction(
            actions![i].text,
            actions![i].child,
            actions![i].onPressed,
            MediaQuery.of(context).size.width,
            radius,
            i == actions!.length - 1,
            actions![i].isDestructive,
            actions![i].withTopBorder
          )
      ] : [],
      buttonPadding: const EdgeInsets.all(0),
    );
  }

  Widget modalAction(String text, Widget? child, Function()? onPressed, double width, double radius,bool last, bool isDestructive, bool withTopBorder) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(last ? radius : 0), bottomRight: Radius.circular(last ? radius : 0)),
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
                    color: withTopBorder ? av.Colors.disabledButton : Colors.transparent,
                    width: withTopBorder ? 1 : 0
                  )
                )
              ),
              padding: const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
              child: Center(
                child: child ?? Text(text,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: isDestructive ? av.Colors.danger : Colors.black)
                )
              )
            ),
          ],
        )
      ),
    );
  }

}

class ModalActionItem {
  ModalActionItem({
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
    this.insetPadding,
  }) : super(key: key);

  final Widget? image;
  final String? title;
  final String? info;
  final Widget? content;
  final List<ModalActionItem>? actions;
  final EdgeInsets? insetPadding;

  @override
  Widget build(BuildContext context) {
    var radius = 12.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [AlertDialog(
      // title: Column(
      //   children: [
      //     image ?? SizedBox(height: 12),
      //     Text(title ?? '', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
      //     SizedBox(height: info != null ? 18 : 0),
      //     Text(info ?? '', style: TextStyle(fontSize: 14, color: av.Colors.secondBlack), textAlign: TextAlign.center),
      //     SizedBox(height: content == null ? 12 : 0)
      //   ],
      // ),
      insetPadding: insetPadding ?? const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
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
          Text(info ?? '', style: const TextStyle(fontSize: 14, color: av.Colors.secondBlack), textAlign: TextAlign.center),
          SizedBox(height: content == null ? 12 : 0)
        ],
      ),
      insetPadding: insetPadding ?? const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
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
      ]);
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
                              color: withTopBorder ? av.Colors.disabledButton : Colors.transparent,
                              width: withTopBorder ? 1 : 0
                          )
                      )
                  ),
                  padding: const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
                  child: Center(
                      child: child ?? Text(text,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: isDestructive ? av.Colors.danger : Colors.black)
                      )
                  )
              ),
            ],
          )
      ),
    );
  }
}