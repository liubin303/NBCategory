Pod::Spec.new do |s|

  s.name         = "NBCategory"
  s.version      = "0.0.1"
  s.summary      = "common use Objective-C category,include UIKit & Foundation some class."
  s.homepage     = "https://github.com/liubin303/NBCategory"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { "liubin303" => "273631976@qq.com" }
  s.platform     = :ios, "7.0"
  s.frameworks   = 'Foundation', 'UIKit',
  s.source       = { :git => "https://github.com/liubin303/NBCategory", :tag => "0.0.1" }
  s.source_files  = 'NBCategory', 'NBCategory/**/*.{h,m}'
  s.requires_arc = true
  
end
