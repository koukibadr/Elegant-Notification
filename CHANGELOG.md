## [1.10.1] - 20/05/2023

* DRY refactorings:
  * assertions in ```elegant_notification.dart```
  * Default icon size property 

## [1.10.0] - 08/05/2023

* Added RTL support [#84](https://github.com/koukibadr/Elegant-Notification/issues/84)

## [1.9.1] - 16/03/2023

* Support any type of widget in Title and description attributes


## [1.8.1] - 16/03/2023

* Fix unhandled exception of the overlay creation with Flutter 3.7 [issue](https://github.com/koukibadr/Elegant-Notification/issues/80)

## [1.8.0] - 14/03/2023

* Customizable progress indicator background color [#78](https://github.com/koukibadr/Elegant-Notification/issues/78)
* Customizable close button widget [PR #77](https://github.com/koukibadr/Elegant-Notification/pull/77)
## [1.7.0] - 11/02/2023

* Added overlay config to package
* Added slide back animation

## [1.6.4] - 09/10/2022

* Add support for all display alignment positions (TopLeft, TopCenter, TopRight, CenterLeft, Center, CenterRight, BottomLeft, BottomCenter, BottomRight)

## [1.6.3] - 18/09/2022

* Fix inactive screen bug when toast is displayed

## [1.6.2] - 13/09/2022

* Fix back button with onDismiss callback usage

## [1.6.1] - 06/08/2022

* Update package flutter 3 support

## [1.6.0] - 02/07/2022

* Fix toast dismiss issues

## [1.5.5] - 02/07/2022

* Fix static analysis issues

## [1.5.4] - 30/05/2022

* Support Flutter 3 null safety
* Update enum names

## [1.5.2] - 08/04/2022

* Fix alignment position display bug (Center, Bottom, Top)

## [1.5.1] - 15/02/2022

* Fix alignment position display bug (Center, Bottom, Top)

## [1.5.0] - 06/02/2022

* Add dismiss and onDismiss parameters
* Add barrier dismissable option
* Bug fixes

## [1.4.0] - 22/01/2022

* Add fromBottom animation type
* Add notification width and height parameters
* Bug fixes

## [1.3.0] - 09/01/2022

* Add notification position parameter
* Merge title and titleStyle parameters
* Merge description and descriptionStyle parameters
* Add action widget with onActionPressed callback
* Add autoDismiss attribute
* Bug fixes

## [1.2.0] - 31/12/2021

* Optional title
* Add background attribute to built-in themes
* Add display progress indicator attribute to built-in themes
* Customizable notification duration
* Bug fixes

## [1.1.0] - 26/12/2021

* Enhanced rendering performance
* Animated progress bar indicator

## [1.0.0] - 14/08/2021

* Built-in notification types
* Display animations types
* Full customization of the notification
* Onclose and ondismiss function callback
