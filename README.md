# Customer_Ordering-Frontend
This is a <a href="https://github.com/flutter/flutter">Flutter</a> project for an online menu presentation application for restaurants and coffeeShops, which has been developed in <a href="https://github.com/FastFeed-ir/FastFeed-Backend">this</a> repository, and APIs are used in this project with the <a href="https://pub.dev/packages/dio">Dio</a> package; It also uses the <a href="https://pub.dev/packages/socket_io_client">socket_io_client</a> package for instant ordering.
## Architecture
This code is written using the <a href="http://github.com/jitsm555/flutter-mvvm/">MVVM</a> architecture.
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
## Preview
 | **Scanning**      | **Show Comments and Informations**     | 
|------------|-------------| 
|  <img src="https://github.com/FastFeed-ir/Customer_Ordering-Frontend/assets/75057732/75c54449-1f41-4302-b04e-aee4f692c5f4.gif" width="250"> |  <img src="https://github.com/FastFeed-ir/Customer_Ordering-Frontend/assets/75057732/8eab75fd-2a22-4e2a-bc81-46bef98c3140.gif" width="250"> |
|  <img src="https://cdn-images-1.medium.com/max/1600/1*Px0kTaFj9fnY2VJdrWGJgA.gif" width="250"> |  <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/75057732/250280759-75c54449-1f41-4302-b04e-aee4f692c5f4.gif" width="250"> |
 | **Search and Ordering**      | **Commenting**     | 
|------------|-------------| 
|  <img src="https://github.com/FastFeed-ir/Customer_Ordering-Frontend/assets/75057732/9dce6015-1d96-4711-a1cc-ca34a5d95d75
" width="250"> |  <img src="https://github.com/FastFeed-ir/Customer_Ordering-Frontend/assets/75057732/303a9429-2139-4b0c-b387-9e7165807a40
" width="250"> |

