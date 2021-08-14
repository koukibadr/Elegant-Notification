
#  Elegant Notification

<p  align="center">
<img  src="https://github.com/koukibadr/Elegant-Notification/blob/main/example/elegant_notification_logo.gif?raw=true"/>
<br>
<b>An elegant notification to display important messages to users</b>
</p>

| ![success_notification.gif](https://github.com/koukibadr/Elegant-Notification/blob/main/example/success_notification.gif?raw=true) | ![info_notification.gif](https://github.com/koukibadr/Elegant-Notification/blob/main/example/info_notification.gif?raw=true) |
|--|--|
| ![error_notification.gif](https://github.com/koukibadr/Elegant-Notification/blob/main/example/error_notification.gif?raw=true) | ![custom_notification.gif](https://github.com/koukibadr/Elegant-Notification/blob/main/example/custom_notification.gif?raw=true) |

##  Features
- Display a top notification with animation
- Built-in themes (Success, Error, Info)
- Different display animations 
- Support custom theme implementation
- onClose and onProgressFinished callback handlers

##  Getting Started
To use this elegant notification package you need to add the dependency in `pubspec.yaml` file.
```yaml
dependencies:
	elegant_notification: ^1.0.0
```

##  Parameters
```dart
///The toast title String (required)
final  String title;


///The title text style
///by default it's `TextStyle(fontWeight: FontWeight.bold, fontSize: 14)`
final  TextStyle titleStyle;


///The toast description text (required)
final  String description;


///The description text style
///by default it's `TextStyle(fontSize: 12)`
final  TextStyle descriptionStyle;


///The toast icon, required only if using the default constructor
///for other toast types (Success, Info, error) the icon is not changeable
late  Widget? icon;


///The size of the icon, by default it's 40px
late  double iconSize;


///The type of the animation set on the notification
///possible values
///{
///FROM_LEFT,
///FROM_RIGHT,
///FROM_TOP
///}
///default value `FROM_LEFT`
final  ANIMATION animation;


///The duration of the animation
///Default value `Duration(milliseconds: 100)`
final  Duration animationDuration;


///The shadow color applied on the notification widget
/// by defualt it's `Colors.grey`
/// for types constructors (Success, Info, Delete) this parameter is unchangeable
late  Color shadowColor;


/// the background color of the notification
/// by default it's set to white
/// for types constructors (Success, Info, Delete) this parameter is unchangeable
late  Color background;


///The color of the progress
///by default it's blue
/// for types constructors (Success, Info, Delete) this parameter is unchangeable
late  Color progressIndicatorColor;


///the border radius of the notification widget
///this parameter it's only set if you are using the default constructor
/// for types constructors (Success, Info, Delete) this parameter is unchangeable
late  double radius;


///The duration how much the notification will take time, duration in milliseconds
///by default the duration is `2500 milliseconds`
final  int toastDuration;


///enable or disable the shadow rendering
///by default it's true
/// for types constructors (Success, Info, Delete) this parameter is unchangeable
late  bool enableShadow;


///enable or disable the progress indicator rendering
///by default the indicator is displayed
/// for types constructors (Success, Info, Delete) this parameter is unchangeable
late  bool showProgressIndicator;


///Display or hide the close button
///by default the close button is displayed
/// for types constructors (Success, Info, Delete) this parameter is unchangeable
final  bool displayCloseButton;


///Function invoked when user press on the close button
final  Function? onCloseButtonPressed;


///Function invoked when the notification is closed after the finish of the progress indicator
final  Function? onProgressFinished;
```

##  Examples

- Success theme animation example
```dart
ElegantNotification.success(
	title:  "Update",
	description:  "Your data has been updated")
.show(context);
```
<p  align="center">
<img  src="https://github.com/koukibadr/Elegant-Notification/blob/main/example/success_notification.gif?raw=true"/>
</p>

- Info theme animation example
```dart
ElegantNotification.info(
	title:  "Info",
	description:  "This account will be updated once you exit")
.show(context);
```
<p  align="center">
<img  src="https://github.com/koukibadr/Elegant-Notification/blob/main/example/info_notification.gif?raw=true"/>
</p>

- Error theme animation example
```dart
ElegantNotification.error(
	title:  "Error",
	description:  "Please verifiy your data")
.show(context);
```
<p  align="center">
<img  src="https://github.com/koukibadr/Elegant-Notification/blob/main/example/error_notification.gif?raw=true"/>
</p>

- Custom theme animation example
```dart
ElegantNotification(
	title:  "New version",
	description:  "A new version is available to you please update.",
	icon:  Icon(Icons.access_alarm,color:  Colors.orange,),
	progressIndicatorColor:  Colors.orange,)
.show(context);
```
<p  align="center">
<img  src="https://github.com/koukibadr/Elegant-Notification/blob/main/example/custom_notification.gif?raw=true"/>
</p>



##  Contribution
Of course the project is open source, and you can contribute to it [repository link](https://github.com/koukibadr/Elegant-Notification)
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.