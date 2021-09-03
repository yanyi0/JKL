#
# Be sure to run `pod lib lint JKL.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JKL'
  s.version          = '0.1.0.Binary'
  s.summary          = 'A short description of JKL.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'JKL,测试源码和静态库二进制文件进行切换'

  s.homepage         = 'https://github.com/yanyi0/JKL'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yanyi0' => '785144130@qq.com' }
  s.source           = { :git => 'https://github.com/yanyi0/JKL.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  if s.version.to_s.include?'Binary'    
    puts '-------------------------------------------------------------------'
    puts 'Notice:JKL is binary now'
    puts '-------------------------------------------------------------------'
    s.prepare_command = '/bin/bash build_lib.sh'
    s.source_files = 'Pod/Products/include/**'
    s.ios.vendored_libraries = 'Pod/Products/lib/*.a'
    s.public_header_files = 'Pod/Products/include/*.h'    
  else
    puts '-------------------------------------------------------------------'
    puts 'Notice:JKL is source code now'
    puts '-------------------------------------------------------------------'
    s.source_files = 'JKL/Classes/**/*'
  end
  
  # s.resource_bundles = {
  #   'JKL' => ['JKL/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
