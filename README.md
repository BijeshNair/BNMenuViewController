# BNMenuViewController

[![Version](https://img.shields.io/cocoapods/v/BNMenuViewController.svg?style=flat)](https://cocoapods.org/pods/BNMenuViewController)
[![License](https://img.shields.io/cocoapods/l/BNMenuViewController.svg?style=flat)](https://cocoapods.org/pods/BNMenuViewController)
[![Platform](https://img.shields.io/cocoapods/p/BNMenuViewController.svg?style=flat)](https://cocoapods.org/pods/BNMenuViewController)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

BNMenuViewController is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BNMenuViewController'
```

## Implementation

```let modalController = BNMenuViewController()
modalController.modalPresentationStyle = .overCurrentContext
modalController.delegate = self
modalController.arrayList = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
modalController.arrayIcons = ["1", "2", "3", "4", "5", "6"]
modalController.iconSize = CGSize(width: 45, height: 45)
modalController.itemTextColor = .white
modalController.itemTextFont = UIFont(name: "Baskerville-SemiBoldItalic", size: 20)!
present(modalController, animated: false, completion: nil)
```
Make sure you set ```modalPresentationStyle``` as ```overCurrentContext```

## Author

Bijesh Nair, bijesh4@gmail.com

## License

BNMenuViewController is available under the MIT license. See the LICENSE file for more info.
