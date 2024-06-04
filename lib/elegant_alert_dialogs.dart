import 'package:elegant_notification/resources/resources_barrel.dart';

// ignore: must_be_immutable
class ElegantAlertDialogs extends StatefulWidget {
  ElegantAlertDialogs({
    Key? key,
    required this.body,
    required this.title,
    this.icon,
    required this.onAccepted,
    required this.onClosed,
    this.buttonText,
    this.showClose,
    this.elevation = 10,
    this.background,
    this.shadowColor,
    this.assertions,
    this.width,
    this.height,
  }) : super(key: key) {
    _notificationType = NotificationType.custom;
  }

  ElegantAlertDialogs.success({
    Key? key,
    required this.body,
    required this.title,
    this.icon,
    required this.onAccepted,
    required this.onClosed,
    this.buttonText,
    this.showClose,
    this.elevation,
    this.background,
    this.shadowColor,
    this.assertions,
    this.height,
    this.width,
  }) : super(key: key) {
    _notificationType = NotificationType.success;
    _checkAssertions();
  }

  ElegantAlertDialogs.info({
    Key? key,
    required this.body,
    required this.title,
    this.icon,
    required this.onAccepted,
    required this.onClosed,
    this.buttonText,
    this.showClose,
    this.elevation,
    this.background,
    this.shadowColor,
    this.assertions,
    this.height,
    this.width,
  }) : super(key: key) {
    _notificationType = NotificationType.info;
    _checkAssertions();
  }

  ElegantAlertDialogs.error({
    Key? key,
    required this.body,
    required this.title,
    this.icon,
    required this.onAccepted,
    required this.onClosed,
    this.buttonText,
    this.showClose,
    this.elevation,
    this.shadowColor,
    this.background,
    this.assertions,
    this.height,
    this.width,
  }) : super(key: key) {
    _notificationType = NotificationType.error;
    _checkAssertions();
  }

  void _checkAssertions() {
    assert(
      icon == null,
      'Icon cannot be assigned to {ElegantAlertDialogs.error} use {ElegantAletDialog(icon: yourIconWidget)} insted',
    );
    assert(
      background == null,
      'Background cannot be assigned to {ElegantAlertDialogs.error} use {ElegantAletDialog(background: yourBackgroundContainer)} insted',
    );
  }

  /// 'title' for the alert dialog.
  final Text title;

  /// 'body' for the alert dialog.
  final Text body;

  /// Used to change the default button text.
  final Text? buttonText;

  /// Used to provide custom icons in the alert dialog.
  final Widget? icon;

  /// Perform function assigned when the default accept button is pressed.
  final void Function() onAccepted;

  /// Perform function assigned when the alert dialog closes using the default close button.
  final void Function() onClosed;
  // Changes the elevation of the alert dialog.
  final double? elevation;

  /// Changes the shadowColor of the alert dialog.
  final Color? shadowColor;
  // Use this if you want to change the background of the alert dialog. It is a normal container to give more flexiblity.
  final Container? background;

  /// If you want to show custom buttons/options in the alert dialog. If you are hitting the edges then consider changing
  /// height and width
  final Row? assertions;

  /// Change to 'false' if you do not want to show the default close icon in the top left.
  final bool? showClose;

  /// 'height' of the alert dialog.
  final double? height;

  /// 'width' of the alert dialog.
  final double? width;

  late NotificationType _notificationType;

  OverlayEntry? overlayEntry;
  // final Key uniqueKey = UniqueKey();

  // String get internalKey => uniqueKey.toString();

  void show(BuildContext context) {
    overlayEntry = _overlayEntryBuilder();
    Overlay.maybeOf(context)?.insert(overlayEntry!);
  }

  void remove(BuildContext context) {
    overlayEntry!.remove();
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      opaque: false,
      builder: (context) {
        return Positioned(
          left: MediaQueryData.fromView(View.of(context)).size.width / 8,
          top: MediaQueryData.fromView(View.of(context)).size.height / 4,
          width: width ?? MediaQuery.of(context).size.width * 0.75,
          height: height ?? MediaQuery.of(context).size.height * 0.35,
          child: Material(
            color: Colors.transparent,
            child: this,
          ),
        );
      },
    );
  }

  @override
  State<ElegantAlertDialogs> createState() => _CustomAlertDialogsState();
}

class _CustomAlertDialogsState extends State<ElegantAlertDialogs>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _popUpTween;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..addListener(() {
        setState(() {});
      });
    _popUpTween = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => animate());
  }

  void animate() {
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _popUpTween.value,
      child: PhysicalModel(
        color: Colors.transparent,
        shadowColor: widget.shadowColor ?? const Color.fromRGBO(0, 0, 0, 0.55),
        elevation: widget.elevation ?? 10,
        child: widget.background ??
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.35,
              color: const Color.fromRGBO(250, 250, 250, 1),
              child: Column(
                children: [
                  Visibility(
                    visible: widget.showClose ?? true,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          widget.onClosed();
                          widget.remove(context);
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: widget._notificationType == NotificationType.info
                        ? IconsFactory.drawIcons(
                            NotificationType.info,
                            context,
                          )
                        : widget._notificationType == NotificationType.success
                            ? IconsFactory.drawIcons(
                                NotificationType.success,
                                context,
                              )
                            : widget._notificationType == NotificationType.error
                                ? IconsFactory.drawIcons(
                                    NotificationType.error,
                                    context,
                                  )
                                : widget.icon,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: widget.title,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      bottom: MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: widget.body,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: widget.assertions ??
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            backgroundColor: widget._notificationType ==
                                    NotificationType.info
                                ? inforColor
                                : widget._notificationType ==
                                        NotificationType.success
                                    ? successColor
                                    : widget._notificationType ==
                                            NotificationType.error
                                        ? errorColor
                                        : null,
                            minimumSize: const Size(50, 50),
                            maximumSize: const Size(55, 55),
                          ),
                          onPressed: () {
                            widget.onAccepted();
                            widget.remove(context);
                          },
                          child: widget.buttonText ??
                              const Text(
                                'Accept',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                        ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
