Pod::Spec.new do |s|
  s.name = 'RadiantForms'
  s.version = '2.0-beta7'
  s.license = 'MIT'
  s.summary = 'RadiantForms is an iOS framework for creating forms'
  s.homepage = 'https://github.com/radiantkit/radiantforms-ios'
  s.documentation_url = 'https://radiantkit.github.io/radiantforms-ios'
  s.authors = { 'Simon Strandgaard' => 'simon@iroots.dk' }
  s.source = { :git => 'https://github.com/radiantkit/radiantforms-ios.git', :tag => s.version }
  s.source_files = 'Source/*/*.swift'
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.requires_arc = true
end
