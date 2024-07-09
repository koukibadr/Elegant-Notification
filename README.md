# Elegant Notification

<p  align="center">
<img  src="https://raw.githubusercontent.com/koukibadr/Elegant-Notification/dev/example/elegant_notification_logo.gif?raw=true"/>
<br>
<b>An elegant notification to display important messages to users</b>

</p>

|![success_notification.gif](https://raw.githubusercontent.com/koukibadr/Elegant-Notification/dev/example/success_elegant_notification.gif?raw=true) | ![info_notification.gif](https://raw.githubusercontent.com/koukibadr/Elegant-Notification/dev/example/info_elegant_notification.gif?raw=true)|
| ------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
|![error_notification.gif](https://raw.githubusercontent.com/koukibadr/Elegant-Notification/dev/example/error_elegant_notification.gif?raw=true) | ![custom_notification.gif](https://raw.githubusercontent.com/koukibadr/Elegant-Notification/dev/example/custom_elegant_notification.gif?raw=true)|

**Stacked elegant notification**
![custom_notification.gif](https://raw.githubusercontent.com/koukibadr/Elegant-Notification/dev/example/stacked_example_1.gif?raw=true)



## Features

- **Display a top notification with animation**
- **A-stacked friendly toast**
- **Built-in themes (Success, Error, Info)**
- Different display animations (fromTop, fromBottom, fromLeft, fromRight)
- Support for all display alignment positions
  (TopLeft, TopCenter, TopRight, CenterLeft, Center, CenterRight, BottomLeft, BottomCenter, BottomRight)
- Support custom theme implementation
- on close and on progress finished callback handlers
- Animated progress bar indicator
- Customizable dismiss direction
- Background customization
- Animation duration customization
- Notification position customization
- Add clickable action widget to notification
- Notification dismiss customization
- Customizable notification dimensions (height and width)
- Customizable barrier dismission and on dismiss action
- Slide back animation
- Customizable close button
- Customizable border and border radius
- RTL support

## Getting Started

To use this elegant notification package you need to add the dependency in `pubspec.yaml` file.

```yaml
dependencies:
	elegant_notification: ^2.2.2
```

## Parameters

`

````dart
  ///The toast title widget
  final Widget? title;

  ///The toast description widget
  final Widget description;

  ///a secondary widget displayed under the description widget
  ///by default `action == null`
  final Widget? action;

  ///The toast icon, required only if using the default constructor
  ///for other toast types (Success, Info, error) the icon is not changeable
  ///
  late Widget? icon;

  ///The size of the icon, by default it's 20px
  ///
  final double iconSize;

  ///The type of the animation set on the notification
  ///possible values
  ///```dart
  ///{
  ///fromLeft,
  ///fromRight,
  ///fromTop,
  ///fromBottom,
  ///}
  ///```
  ///default value `fromLeft`
  ///
  final AnimationType animation;

  ///The duration of the animation
  ///Default value `Duration(milliseconds: 600)`
  ///
  final Duration animationDuration;

  //The toast animation curve by default the curve is set to [Curves.ease]
  final Curve animationCurve;

  /// the background color of the notification
  /// by default it's set to white
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable
  late Color background;


  ///the border radius of the notification widget
  final BorderRadius? borderRadius;

  ///The notification widget border
  final BoxBorder? border;

  ///How much the notification will take time,
  ///by default the duration is `3000 milliseconds`
  ///
  final Duration toastDuration;

  ///The notification shadow
  final BoxShadow? shadow;

  ///enable or disable the progress indicator rendering
  ///by default the indicator is displayed
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable
  ///
  late bool showProgressIndicator;

  ///The color of the progress
  ///by default it's blue
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable
  late Color progressIndicatorColor;

  ///progress bar indicator width, by default it's null so it takes the widget's width
  final double? progressBarWidth;

  ///progress bar indicator height, by default it's null so it takes the widget's height
  final double? progressBarHeight;

  ///progress bar indicator padding constraints
  final EdgeInsetsGeometry? progressBarPadding;

  ///The progress indicator background color
  ///by default it's grey
  final Color progressIndicatorBackground;

  ///Display or hide the close button
  ///by default the close button is displayed
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable
  ///
  final bool displayCloseButton;

  ///Close widget rendered as the close function
  ///by default the close button is displayed, if you don't want it set `closeButton` to null
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable
  ///
  final Widget Function(void Function() dismissNotification)? closeButton;

  ///Function invoked when user press on the close button
  final void Function()? onCloseButtonPressed;

  ///Function invoked when the notification is closed after the finish of the progress indicator
  ///
  final void Function()? onProgressFinished;

  ///Function invoked when the user taps on the notification
  final void Function()? onNotificationPressed;

  ///Function invoked when tapping outside the notification
  ///Or when pressing the back button of the phone
  ///or when tapping on the screen
  final Function()? onDismiss;

  ///define whether the notification will be dismissed automatically or not
  ///by default `autoDimiss == false`
  final bool autoDismiss;

  ///The direction of the dismissible widget
  ///by default it's `DismissDirection.horizontal`
  final DismissDirection dismissDirection;

  ///The notification position in the screen
  ///by default the position is set to `Alignment.topRight`
  final Alignment position;

  ///the width of the notification widget
  final double? width;

  ///the height of the notification widget
  final double? height;

  ///If the notification is dismissible or not
  ///by default it's true
  final bool isDismissable;

  /// The margin between the notification and the edge of the screen
  final double notificationMargin;

  /// The options for the stacked mode
  final StackedOptions? stackedOptions;
`

````

## Migration to 2.0.0

- `enableShadow` and `shadowColor` are removed replaced with `shadow`
- `onActionPressed` is removed directly you can wrap the action widget with `InkWell` or `GestureDetector`

## Examples

- **Success theme animation example**

```dart
ElegantNotification.success(
	title:  Text("Update"),
	description:  Text("Your data has been updated"),
  onDismiss: () {
      print('Message when the notification is dismissed');
  },
  onTap: () {
      print('Message when the notification is pressed');
  },
  closeOnTap: true,
).show(context);

```

<br>

- **Stacked notifications Example 1**

```dart
ElegantNotification.success(
  width: 360,
  isDismissable: false,
  animationCurve: Curves.bounceOut,
  stackedOptions: StackedOptions(
    key: 'top',
    type: StackedType.same,
    itemOffset: Offset(-5, -5),
  ),
  position: Alignment.topCenter,
  nimation: AnimationType.fromTop,
  title: Text('Update'),
  description: Text('Your data has been updated'),
  onDismiss: () {},
  onNotificationPressed: () {},
).show(context);
```

<br>


- **Stacked notifications Example 2**

```dart
ElegantNotification.error(
  width: 360,
  stackedOptions: StackedOptions(
    key: 'topRight',
    type: StackedType.below,
    itemOffset: Offset(0, 5),
  ),
  position: Alignment.topRight,
  animation: AnimationType.fromRight,
  title: Text('Error'),
  description: Text('Error example notification'),
  onDismiss: () {},
).show(context);
```

<br>


- **With box shadow example**

```dart
ElegantNotification.success(
  width: 360,
  isDismissable: false,
  animationCurve: Curves.bounceOut,
  position: Alignment.topCenter,
  animation: AnimationType.fromTop,
  title: Text('Update'),
  description: Text('Your data has been updated'),
  onDismiss: () {},
  onNotificationPressed: () {},
  shadow: BoxShadow(
    color: Colors.green.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 5,
    offset: const Offset(0, 4),
    ),
).show(context);

```

<br>

- **Info theme animation example**

```dart
ElegantNotification.info(
	title:  Text("Info"),
	description:  Text("This account will be updated once you exit")
).show(context);

```
<br>

- **Error theme animation example**

```dart
ElegantNotification.error(
	title:  Text("Error"),
	description:  Text("Please verifiy your data")
).show(context);

```

- **Custom theme animation example**

```dart
ElegantNotification(
	title:  ("New version"),
	description:  Text("A new version is available to you please update."),
	icon: Icon(
		Icons.access_alarm,
		color: Colors.orange,
	),
	progressIndicatorColor: Colors.orange,
).show(context);

```

- **Without title**

```dart
ElegantNotification.error(
	description:  Text("Please verifiy your data")
).show(context);
```

- **With Action**

```dart
ElegantNotification.info(
	description:  Text('This account will be updated once you exit',),
	action: InkWell(
    onTap: (){
      print('Link pressed')
    }
    child:Text( 'Link',
      style:  TextStyle(
        decoration:  TextDecoration.underline,
        color:  Colors.blue,
      ),
    )
  ),
).show(context);
```

- **Using `dismissDirection` attribute**

```dart
ElegantNotification.success(
  width: 360,
  position: Alignment.topCenter,
  animation: AnimationType.fromTop,
  title: Text('Update'),
  description: Text('Your data has been updated'),
  onDismiss: () {
    print('Message when the notification is dismissed');
  },
  onNotificationPressed: () {
    print('Message when the notification is pressed');
  },
  isDismissible: true,
  dismissDirection: DismissDirection.up,
).show(context);

```

## Contribution

Of course the project is open source, and you can contribute to it [repository link](https://github.com/koukibadr/Elegant-Notification)

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Contributors

<a href="https://github.com/koukibadr/Elegant-Notification/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=koukibadr/Elegant-Notification" />
</a>
