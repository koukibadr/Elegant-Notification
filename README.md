
  

  

#  Elegant Notification

  

  

  

<p  align="center">
<img  src="https://github.com/koukibadr/Elegant-Notification/blob/main/example/elegant_notification_logo.gif?raw=true"/>
<br>
<b>An elegant notification to display important messages to users</b>

</p>

  

  

  

| ![success_notification.gif](https://github.com/koukibadr/Elegant-Notification/blob/main/example/success_elegant_notification.gif?raw=true) | ![info_notification.gif](https://github.com/koukibadr/Elegant-Notification/blob/main/example/info_elegant_notification.gif?raw=true) |
|--|--|
| ![error_notification.gif](https://github.com/koukibadr/Elegant-Notification/blob/main/example/error_elegant_notification.gif?raw=true) | ![custom_notification.gif](https://github.com/koukibadr/Elegant-Notification/blob/main/example/custom_elegant_notification.gif?raw=true) |

  

  

  

##  Features

  

-  Display a top notification with animation
-  Built-in themes (Success, Error, Info)
-  Different display animations (fromTop, fromBottom, fromLeft, fromRight)
-  Support custom theme implementation
-  onClose and onProgressFinished callback handlers
-  animated progress bar indicator
-  background costumization
-  Animation duration customization
-  Notification position customization
-  Add clickable action widget to notification
-  Notification dismiss customization
-  Customizable notification dimensions (height and width)
-  Customizable barrier dismission and on dismiss action

  

  

##  Getting Started

To use this elegant notification package you need to add the dependency in `pubspec.yaml` file.


```yaml
dependencies:
	elegant_notification: ^1.5.5
```


##  Parameters

```dart
///The toast title if any
final  Text?  title;

///The toast description text (required)
final  Text  description;

///The toast icon, required only if using the default constructor
///for other toast types (Success, Info, error) the icon is not changeable
late Widget? icon;


///The size of the icon, by default it's 40px
late double iconSize;
  

///The type of the animation set on the notification
///possible values
///```dart
///{
///fromLeft,
///fromRight,
///fromTop,
///fromBottom
///}
///```
///default value `fromLeft`
///
final AnimationType animation;

  
///The duration of the animation
///Default value `Duration(milliseconds: 100)`
final Duration animationDuration;


///The shadow color applied on the notification widget
/// by defualt it's `Colors.grey`
/// for types constructors (Success, Info, Delete) this parameter is unchangeable
late Color shadowColor = Colors.grey;


/// the background color of the notification
/// by default it's set to white
/// for types constructors (Success, Info, Delete) this parameter is unchangeable
late Color background;


///The color of the progress
///by default it's blue
/// for types constructors (Success, Info, Delete) this parameter is unchangeable
late Color progressIndicatorColor;


///the border radius of the notification widget
///this parameter it's only set if you are using the default constructor
/// for types constructors (Success, Info, Delete) this parameter is unchangeable
late double radius;


///The duration how much the notification will take time, duration in milliseconds
///by default the duration is `2500 milliseconds`
final int toastDuration;


///enable or disable the shadow rendering
///by default it's true
/// for types constructors (Success, Info, Delete) this parameter is unchangeable
late bool enableShadow =  true;


///enable or disable the progress indicator rendering
///by default the indicator is displayed
/// for types constructors (Success, Info, Delete) this parameter is unchangeable
late bool showProgressIndicator;


///Display or hide the close button
///by default the close button is displayed
/// for types constructors (Success, Info, Delete) this parameter is unchangeable
final bool displayCloseButton;


///Function invoked when user press on the close button
final Function? onCloseButtonPressed;


///Function invoked when the notification is closed after the finish of the progress indicator
final Function? onProgressFinished;


///The type of the align set on the notification
///possible values
///{
///top,
///center,
///bottom
///}
///default value `top`
///
final  NotificationPosition  notificationPosition;


///Action widget rendered with clickable inkwell
///by default `action == null`
final  Widget?  action;


///Function invoked when pressing `action` widget
///must be not null when `action != null`
final  Function()?  onActionPressed;


///define whether the notification will be dismissed automatically or not
///by default `autoDimiss == false`
final  bool  autoDismiss;

///the width of the notification widget
final double? width;

///the height of the notification widget
final double? height;

///dismiss notification by tapping outside
///by default `dismissible == false`
final bool dismissible;

///Function invoked when tapping outside the notification
final Function()? onDismiss;
```

  

  

##  Migration to 1.1.0

If you are using 1.0.0 you need to update `animation` attribute values following the camelCase conventions
(eg: FROM_TOP -> fromTop)


##  Migration to 1.3.0

If you are using version less than 1.3.0 you need to update the usage of title and description because in 1.3.0 there's no longer `descriptionStyle`  and `titleStyle` attributes those parameters are merged into `title` and `description` so now you pass a `Text` object.

##  Migration to 1.5.1

If you are using `dismissable` attribute in the 1.5.1 version the notification position should be set to `NOTIFICATION_POSITION.bottom` otherwise you need to set dismissable to false to change the notification position (center, bottom or top)


##  Migration to 1.5.4

Enum names has been changed:
`NOTIFICATION_POSITION` is now `NotificationPostion`
`ANIMATION` is now `AnimationType`


  

##  Examples


-  Success theme animation example

```dart
ElegantNotification.success(
	title:  Text("Update"),
	description:  Text("Your data has been updated")
).show(context);

```

<p  align="center">
<img  src="https://github.com/koukibadr/Elegant-Notification/blob/main/example/success_elegant_notification.gif?raw=true"/>
</p>

<br>

-  Info theme animation example

```dart
ElegantNotification.info(
	title:  Text("Info"),
	description:  Text("This account will be updated once you exit")
).show(context);

```

<p  align="center">
<img  src="https://github.com/koukibadr/Elegant-Notification/blob/main/example/info_elegant_notification.gif?raw=true"/>

</p>

-  Error theme animation example

```dart
ElegantNotification.error(
	title:  Text("Error"),
	description:  Text("Please verifiy your data")
).show(context);

```
<p  align="center">
<img  src="https://github.com/koukibadr/Elegant-Notification/blob/main/example/error_elegant_notification.gif?raw=true"/>
</p>

-  Custom theme animation example

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

<p  align="center">
<img  src="https://github.com/koukibadr/Elegant-Notification/blob/main/example/custom_elegant_notification.gif?raw=true"/>
</p>


-  Without title

```dart
ElegantNotification.error(
	description:  Text("Please verifiy your data")
).show(context);
```

-  With Action

```dart
ElegantNotification.info(
	description:  Text('This account will be updated once you exit',),
	action:  Text(
		'Link',
		style:  TextStyle(
			decoration:  TextDecoration.underline,
			color:  Colors.blue,
		),
	),
	onActionPressed: (){
		print('Link pressed');
	},
).show(context);
```

##  Contribution

  
Of course the project is open source, and you can contribute to it [repository link](https://github.com/koukibadr/Elegant-Notification)

-  If you **found a bug**, open an issue.
-  If you **have a feature request**, open an issue.
-  If you **want to contribute**, submit a pull request.

## Contributors
<a href="https://github.com/koukibadr/Elegant-Notification/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=koukibadr/Elegant-Notification" />
</a>
