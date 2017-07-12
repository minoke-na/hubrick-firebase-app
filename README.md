# Hubrick Firebase Real Time app

## Installation
The app is built using XCode 8.3 and swift 3. The app does utilize the Firebase third party iOS libraries.
- open the workspace "xcworkspace" in Xcode (not the xcodeproj), because of the Pods dependencies

To install the Firebase pods execute in the app directory
```sh
$ pod install
```
### Test in the simulator
Simply run the app with the latest XCode 8.3 and test in the Simulator
### Test in a device
Please add a Team to the project in the General Settings of the Project in XCode and build in the device that has the latest iOS

## Usage
The app can be used in both Profile/Landscape Layout and it is supported in all the IPhone and IPad devices with the latest iOS 10.3 installed. The design however focuses on the iPhone, so does the App
As backend the App uses the provided Hubrick Firebase DB. To test the functionality, please use the suggested [UI] : https://plnkr.co/edit/WpJsPOj8rbKlIyrXKwgI?p=preview

## Implemented Features
* ADD
All the requirement are implemented, except push notifications. To enable PUSH notifications one needs a developer account and I only have the company one, which I cannot use for personal purposes.
* DELETE
All the requirements are implemented
* UPDATE
All requirements are implemented

## Testing
Some UnitTests are in Place under the /hubrick-firebaseAppTests directory.
To run the tests in XCode you can use the shortcut: `Cmd + U`

### Used Patterns
MVVM is used as a main pattern.

### Problems
There is a performance issue when the articles have larger images (out of the scope of this demo!). Scrolling becomes slow. 
I have commented out the image assignment of the cells and I am assigning a default image to the articles:
see in 
ItemTableViewCell.swift  
```swift
44 //self.avatar.image = self.viewModel?.avatarImage
45 //self.imageItem.image = self.viewModel?.imageItem)
```
### To Do:
Implement Optimizations for the image Loading (e.g. queue work and caching) and image size Reduction!
