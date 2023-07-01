# Customer_Ordering-Frontend
This is a <a href="https://github.com/flutter/flutter">Flutter</a> project for an online menu presentation application for restaurants and coffeeShops, which has been developed in <a href="https://github.com/FastFeed-ir/FastFeed-Backend">this</a> repository, and APIs are used in this project with the <a href="https://pub.dev/packages/dio">Dio</a> package; It also uses the <a href="https://pub.dev/packages/socket_io_client">socket_io_client</a> package for instant ordering.
## Architecture
This code is written using the <a href="http://github.com/jitsm555/flutter-mvvm/tree/master/lib">MVVM</a> architecture.
## Clone project


```
git clone https://github.com/FastFeed-ir/Customer_Ordering-Frontend/
```

## Run this project

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
flutter run
```


## Scenario 
The customer enters the application and scans the QR code that shows the subscription of the restaurant or cafe (previously the subscription was purchased through the purchase project of business owners), after scanning, 2 options are shown, one for registration Comment and one to place an order.<br>
By clicking on placing an order, the store menu set by the restaurateur/café owner will be shown to the customer and he can choose the number of dishes in different categories; He can also quickly access the desired food by using the search function.<br>
After registering the items, he goes to the final order registration page and enters the details if necessary and also views his current shopping cart. By clicking on the order registration button, the order will be displayed automatically in the ordering app of the business owner at <a href="https://github.com/FastFeed-ir/Owner_Ordering-Frontend">this</a> address.<br>
On the successful purchase page, an authentication code will be displayed to register a comment. By scanning again and selecting the option to register a comment, he can enter the authentication code to order his opinion and score without logging in.
