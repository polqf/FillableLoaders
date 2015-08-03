Pod::Spec.new do |s|
  s.name         = "FillableLoaders"
  s.version      = "0.0.2"
  s.summary      = "Collection of completely customizable loaders based in custom CGPaths"
  s.homepage     = "https://github.com/poolqf/FillableLoaders"
  s.license      = 'MIT'
  s.author       = "Pol Quintana"
  s.source       = { :git => "https://github.com/poolqf/FillableLoaders.git", :tag => "0.0.2" }
  s.platform     = :ios, '8.0'
  s.source_files = 'Source'
  s.frameworks   = 'UIKit'
  s.requires_arc = true
  s.social_media_url = 'https://twitter.com/poolqf'
end
