Gem::Specification.new do |s|
  
  s.name        = 'casa-payload'
  s.version     = '0.0.01'
  s.summary     = 'Reference implementation of the CASA Protocol Payload Module'
  s.authors     = ['Eric Bollens']
  s.email       = ['ebollens@ucla.edu']
  s.homepage    = 'https://appsharing.github.io/casa-protocol'
  s.license     = 'BSD-3-Clause'
  
  s.files       = ['lib/casa-payload.rb']
  
  s.add_dependency 'json-schema'
  s.add_dependency 'multi_json'
  s.add_dependency 'json-schema'
  
  s.add_development_dependency 'rake'
  s.add_development_dependency 'hashdiff'
  
end