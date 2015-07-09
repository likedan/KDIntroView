# KDIntroView

<img src="Imgs/showup.gif" width="320" height="550"/>

[![CI Status](http://img.shields.io/travis/likedan/KDIntroView.svg?style=flat)](https://travis-ci.org/likedan/KDIntroView)
[![Version](https://img.shields.io/cocoapods/v/KDIntroView.svg?style=flat)](http://cocoapods.org/pods/KDIntroView)
[![License](https://img.shields.io/cocoapods/l/KDIntroView.svg?style=flat)](http://cocoapods.org/pods/KDIntroView)
[![Platform](https://img.shields.io/cocoapods/p/KDIntroView.svg?style=flat)](http://cocoapods.org/pods/KDIntroView)

## Installation

To install
it, simply add the following line to your Podfile:

```ruby
pod 'KDIntroView', :git => 'https://github.com/likedan/KDIntroView'
```
or drag these files into the project

```ruby
KDIntroView.swift
KDIntroViewController.swift
```
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
iOS 8.0

## Introduction
`KDIntroView` is a framework to create dynamic introduction views for App. You can create all sorts of cool animations.

## Start!!!

Step One


Create all the views you need as xibs. Link each xib file with a class that inherits `KDIntroView`. Override `override func moveEverythingAccordingToIndex(index: CGFloat)` this function.



Design your interface as you wish. This framework works for both code generated UI and autolayout.



Step Two

<img src="Imgs/inst1.jpg" width="700" height="300"/>

Create a ViewController that inherits `KDIntroViewController`. (don't forget to import KDIntroView)


## Author

Kedan Li, TakefiveInteractive.com

## License

KDIntroView is available under the MIT license. See the LICENSE file for more info.
