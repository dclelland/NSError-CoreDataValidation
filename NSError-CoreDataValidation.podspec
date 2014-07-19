#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name                    = "NSError-CoreDataValidation"
  s.version                 = "0.0.1"
  s.summary                 = "NSError category that pretty-prints Core Data validation errors."
  s.homepage                = "https://github.com/dclelland/NSError-CoreDataValidation"
  s.license                 = { :type => 'MIT' }
  s.author                  = { "Daniel Clelland" => "daniel.clelland@gmail.com" }
  s.source                  = { :git => "https://github.com/dclelland/NSError-CoreDataValidation.git", :tag => "0.0.1" }
  s.platform                = :ios, '7.0'
  s.ios.deployment_target   = '7.0'
  s.ios.source_files        = 'NSError-CoreDataValidation/*.{h,m}'
  s.requires_arc            = true
end