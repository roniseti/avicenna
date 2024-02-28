import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Container with tappable ability
class AvicennaContainer extends StatelessWidget {
  const AvicennaContainer({
    Key? key,
    this.onTap,
    this.onLongPress,
    required this.child,
    this.width,
    this.margin = const EdgeInsets.only(left: 12, top: 12, right: 12),
    this.padding = const EdgeInsets.all(18),
    this.borderRadius = 8,
    this.color = Colors.white,
    this.boxShadow,
    this.border
  }) : super(key: key);

  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget child;
  final double? width;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color color;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;
  //boxConstrains constrains

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow,
        border: border
      ),
      child: Material(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onTap,
          onLongPress: onLongPress,
          child: Padding(
            padding: padding,
            child: child
          )
        )
      )
    );
  }

}

class NewAvicennaContainer extends StatefulWidget {
  const NewAvicennaContainer({
    Key? key,
    this.onTap,
    this.onLongPress,
    required this.child,
    this.width,
    this.margin = const EdgeInsets.only(left: 12, top: 12, right: 12),
    this.padding = const EdgeInsets.all(18),
    this.borderRadius = 8,
    this.color = Colors.white,
    this.boxShadow,
    this.isTransparent = false,
    this.border,
    this.semanticLabel
  }) : super(key: key);

  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget child;
  final double? width;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color color;
  final List<BoxShadow>? boxShadow;
  final bool isTransparent;
  final BoxBorder? border;
  final String? semanticLabel;

  @override
  State<NewAvicennaContainer> createState() => _NewAvicennaContainerState();
}

class _NewAvicennaContainerState extends State<NewAvicennaContainer> with SingleTickerProviderStateMixin {
  static const Duration kFadeOutDuration = Duration(milliseconds: 120);
  static const Duration kFadeInDuration = Duration(milliseconds: 180);
  // final Tween<double> _opacityTween = Tween<double>(begin: 1.0);
  Tween<double> _opacityTween = Tween<double>(begin: 0.0);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    if (widget.isTransparent) _opacityTween = Tween<double>(begin: 1.0);
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
    _opacityTween.end = widget.isTransparent ? 0.6 : 0.3;
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
    bool disabled = widget.onTap != null && widget.onLongPress != null;
    return widget.isTransparent ? Container(
      width: widget.width,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        boxShadow: widget.boxShadow,
        border: widget.border
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: !disabled ? _handleTapDown : null,
        onTapUp: !disabled ? _handleTapUp : null,
        onTapCancel: !disabled ? _handleTapCancel : null,
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        child: Semantics(
          button: true,
          label: widget.semanticLabel,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              // minHeight: widget.minSize!,
              minWidth: widget.width ?? MediaQuery.of(context).size.width,
            ),
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  color: widget.color,
                ),
                child: Padding(
                  padding: widget.padding,
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    ) : Stack(
      children: [
        Container(
          width: widget.width,
          margin: widget.margin,
          decoration: BoxDecoration(
            color: widget.isTransparent ? Colors.transparent : widget.color,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: widget.boxShadow,
            border: widget.border
          ),
          child: Semantics(
            button: true,
            label: widget.semanticLabel,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                // minHeight: widget.minSize!,
                minWidth: widget.width ?? MediaQuery.of(context).size.width,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  color: widget.color,
                ),
                child: Padding(
                  padding: widget.padding,
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
        FadeTransition(
          opacity: _opacityAnimation,
          child:  Container(
            width: widget.width,
            margin: widget.margin,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: widget.border
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: !disabled ? _handleTapDown : null,
              onTapUp: !disabled ? _handleTapUp : null,
              onTapCancel: !disabled ? _handleTapCancel : null,
              onTap: widget.onTap,
              onLongPress: widget.onLongPress,
              child: Semantics(
                button: true,
                label: widget.semanticLabel,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    // minHeight: widget.minSize!,
                    minWidth: widget.width ?? MediaQuery.of(context).size.width,
                  ),
                  child: Opacity(
                    opacity: 0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(widget.borderRadius),
                        color: const Color(0xFFE0E0E0),
                      ),
                      child: Padding(
                        padding: widget.padding,
                        child: widget.child,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}

class AvicennaPress extends StatefulWidget {
  const AvicennaPress({
    Key? key,
    this.onTap,
    this.onLongPress,
    required this.child,
    this.debugColor,
    this.semanticLabel
  }) : super(key: key);

  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget child;
  final Color? debugColor;
  final String? semanticLabel;

  @override
  State<AvicennaPress> createState() => _AvicennaPressState();
}

class _AvicennaPressState extends State<AvicennaPress> with SingleTickerProviderStateMixin {
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
      color: widget.debugColor,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        onTap: widget.onTap,
        onLongPress: widget.onLongPress != null ? () {
          HapticFeedback.heavyImpact();
          widget.onLongPress!.call();
        } : null,
        child: Semantics(
          button: true,
          label: widget.semanticLabel,
          child: FadeTransition(
            opacity: _opacityAnimation,
            child: widget.child,
          ),
        ),
      ),
    );
  }

}
