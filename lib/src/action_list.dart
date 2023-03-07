import 'package:avicenna/avicenna.dart';
import 'package:flutter/material.dart';

class AvicennaActionListGroup extends StatelessWidget {
  const AvicennaActionListGroup({
    Key? key,
    required this.menus,
    this.radius = 12,
  }) : super(key: key);

  final List<AvicennaActionListItem> menus;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: AvicennaProps.boxShadowSoftEqual
      ),
      child: Column(
        children: [
          for (var i = 0; i < menus.length; i++) ...[
            if (i != 0 && i != menus.length) ...[
              const Divider(height: 0, thickness: 1),
            ],
            AvicennaMenuAction(
              width: MediaQuery.of(context).size.width,
              onPressed: menus[i].onPressed,
              radius: radius,
              first: i == 0,
              last: i == menus.length - 1,
              child: menus[i].customWidget ?? Row(
                children: [
                  menus[i].icon,
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(menus[i].title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        if (menus[i].subTitle != null) ...[
                          const SizedBox(height: 4),
                          Text(menus[i].subTitle ?? '', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AvicennaColors.thirdBlack))
                        ]
                      ],
                    )
                  ),
                  menus[i].trailing ?? const SizedBox()
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }
}

class AvicennaActionListItem {
  const AvicennaActionListItem({
    required this.title,
    this.customWidget,
    this.subTitle,
    this.onPressed,
    required this.icon,
    this.trailing,
  });

  final String title;
  final Widget? customWidget;
  final String? subTitle;
  final Function()? onPressed;
  final Widget icon;
  final Widget? trailing;
}

class AvicennaMenuAction extends StatefulWidget {
  const AvicennaMenuAction({
    Key? key,
    this.child,
    this.onPressed,
    required this.width,
    required this.radius,
    required this.first,
    required this.last,
  }) : super(key: key);

  final Widget? child;
  final Function()? onPressed;
  final double width;
  final double radius;
  final bool first;
  final bool last;

  @override
  State<AvicennaMenuAction> createState() => _AvicennaMenuActionState();
}

class _AvicennaMenuActionState extends State<AvicennaMenuAction> with SingleTickerProviderStateMixin {
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
      ? _animationController.animateTo(1.0, duration: kFadeOutDuration, curve: Curves.easeOutCubic)
      : _animationController.animateTo(0.0, duration: kFadeInDuration, curve: Curves.easeOutCubic);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) _animate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.first ? widget.radius : 0),
          topRight: Radius.circular(widget.first ? widget.radius : 0),
          bottomLeft: Radius.circular(widget.last ? widget.radius : 0),
          bottomRight: Radius.circular(widget.last ? widget.radius : 0),
        ),
        color: const Color(0xFFE0E0E0),
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(widget.first ? widget.radius : 0),
                    topRight: Radius.circular(widget.first ? widget.radius : 0),
                    bottomLeft: Radius.circular(widget.last ? widget.radius : 0),
                    bottomRight: Radius.circular(widget.last ? widget.radius : 0),
                  ),
                  color: const Color(0xFFFFFFFF),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
                  child: Align(
                    alignment: Alignment.center,
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: widget.child,
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
