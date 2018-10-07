Pod::Spec.new do |s|

  s.name         = "SwiftLayoutable"
  s.version      = "0.1-beta"
  s.summary      = "Swift reimplement of Autolayout"

  s.description  = <<-DESC  
                  Layoutable is a swift reimplement of apple's Autolayout. 
                  * It uses the same Cassowary algorithm as it's core and provides a set of api similar to Autolayout. 
                  * The difference is that Layouable is more flexable and easy to use.Layoutable don't rely on UIView, it can be used in any object that conform to Layoutable protocol such as CALaye or self defined object.
                  * It can be used in background thread which is the core benefit of Layoutable. Layoutable also provides high level api and syntax sugar to make it easy to use.
                   DESC

  s.homepage     = "https://github.com/nangege/Layoutable"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.authors            = { "nangege" => "1543640002@qq.com" }

  s.swift_version = "4.2"

  s.ios.deployment_target = "8.0"
  s.module_name = "Layoutable"


  s.source       = { :git => "https://github.com/nangege/Layoutable.git", :tag => '0.1-beta' }
  s.source_files  = ["Layoutable/Sources/*.swift", "Layoutable/Layoutable.h"]
  s.public_header_files = ["Layoutable/Layoutable.h"]
  

  s.requires_arc = true

  s.dependency 'SwiftCassowary', '~> 0.1-beta'

end
