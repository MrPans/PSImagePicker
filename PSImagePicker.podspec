Pod::Spec.new do |s|

  s.name         = "PSImagePicker"
  s.version      = "1.0.0"
  s.summary      = "A convenience image picker"
  s.description  = <<-DESC
                   A convenience image picker. 
                   Pick ONE image from camera or PhotoLibrary fast and make your ViewController code clean.
                   DESC
  s.homepage     = "https://github.com/DeveloperPans/PSImagePicker"
  s.screenshots  = "https://raw.githubusercontent.com/DeveloperPans/PSImagePicker/master/PSImagePicker.gif"
  s.license      = "MIT"
  s.author             = { "Pan" => "developerpans@163.com" }
  s.social_media_url = 'http://shengpan.net'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source       = { :git => "https://github.com/DeveloperPans/PSImagePicker.git", :tag => s.version.to_s }
  s.source_files = 'PSImagePickerExample/PSImagePicker/**/*.{h,m}'
end
