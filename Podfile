# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'


Pod::Spec.new do |s|
    #1.
    s.name               = "AnnexCloudRNR"
    #2.
    s.version            = "1.0.0"
    #3.
    s.summary         = "Sort description of 'AnnexCloudRNR' framework"
    #4.
    s.homepage        = "http://www.annexcloud.com"
    #5.
    s.license              = "Annex Cloud Inc"
    #6.
    s.author               = "Sachin Khaire"
    #7.
    s.platform            = :ios, "10.0"
    #8.
    s.source              = { :git => "URL", :tag => "1.0.0" }
    #9.
    s.source_files     = "AnnexCloudRNR", "AnnexCloudRNR/**/*.{h,m,swift}"
end


target 'AnnexCloudRNR' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for AnnexCloudRNR
  pod 'ReachabilitySwift'
  pod ‘Alamofire’

  target 'AnnexCloudRNRTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
