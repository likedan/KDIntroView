#
# Be sure to run `pod lib lint KDIntroView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "KDIntroView"
  s.version          = "1.2.0"
  s.summary          = "KDIntroView is a framework to create dynamic introduction views for App. You can create all sorts of cool animations."

  s.description      = <<-DESC
Step One

Create all the views you need as xibs. Link each xib file with a class that inherits KDIntroView. Override moveEverythingAccordingToIndex(index: CGFloat).

Design your interface as you wish. This framework works for both code generated UI and autolayout.

Make sure each view has a clear background color if you wish to perform color change.

Step Two

Create a ViewController that inherits KDIntroViewController. (don't forget to import KDIntroView)

In viewWillAppear, call setup, and pass in an array that contains the name of all the xibs you created. Arrange them in the order you with them to appear. Override moveEverythingAccordingToIndex(index: CGFloat).

Now, you can see your views, but they are static.

Step Three

Implement the moveEverythingAccordingToIndex(index: CGFloat) in each view. The index: CGFloat variable is the offset of the scroller. In the first and the last view, index: CGFloat range from 0 ~ frame.width. In all the other views, index: CGFloat range from 0 ~ 2 * frame.width.

We have build-in functions, but you can easily customize your animation with CGAffineTransformation. There are more example in the demo project.

Also implement the moveEverythingAccordingToIndex(index: CGFloat) in viewcontroller to perform color animation and touchable elements. All the touchable elements must be added in the view controller and call view.bringSubviewToFront() after setup to make them reachable.

You can literally create any kind of animation! Play around with it, and free your imagination!
                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/likedan/KDIntroView"
  s.license          = 'MIT'
  s.author           = { "likedan" => "likedan5@icloud.com" }
  s.source           = { :git => "https://github.com/likedan/KDIntroView.git", :tag => "1.2.0" }
   s.social_media_url = 'http://takefiveinteractive.com'

  s.platform     = :ios, '10.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/*.swift'

end
