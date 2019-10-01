Pod::Spec.new do |s|
  s.name = "Bureau"
  s.version = '0.1.0'
  s.swift_version = "5.1"
  s.summary = "An easy way to display a custom view on the input view in UIKit."
  s.homepage = "https://github.com/muukii/Bureau"
  s.license = 'MIT'
  s.authors = {
    "Muukii" => "muukii.app@gmail.com"
  }
  s.source = { :git => "https://github.com/muukii/Bureau.git", :tag => s.version }

  s.social_media_url = 'https://twitter.com/muukii_app'
  s.source_files = ['Bureau/**/*.{swift}']

  s.module_name = s.name
  s.requires_arc = true
  s.ios.deployment_target = '10.0'
  s.ios.frameworks = ['Foundation', 'UIKit']
end