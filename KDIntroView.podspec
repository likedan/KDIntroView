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
  s.version          = "1.1.1"
  s.summary          = "KDIntroView is a framework to create dynamic introduction views for App. You can create all sorts of cool animations."
  s.description      = <<-DESC
                       An optional longer description of KDIntroView

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/likedan/KDIntroView"
  s.screenshots     = "https://github.com/likedan/KDIntroView/Imgs/showup.git"
  s.license          = 'MIT'
  s.author           = { "likedan" => "likedan5@icloud.com" }
  s.source           = { :git => "https://github.com/likedan/KDIntroView.git", :tag => "1.1.1" }
   s.social_media_url = 'https://takefiveinteractive'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/*.swift'
  s.resource_bundles = {
    'KDIntroView' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
