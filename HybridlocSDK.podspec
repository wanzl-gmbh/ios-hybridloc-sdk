Pod::Spec.new do |s|
    s.name                      = 'HybridlocSDK'
    s.version                   = '1.0.0'
    s.platform                  = :ios, '14.0'
    s.summary                   = 'An SDK to unlock trolleys via Wanzl\'s Hybridloc'
    s.homepage                  = 'https://github.com/wanzl-gmbh/ios-hybridloc-sdk'
    s.license                   = { :type => 'MIT' }
    s.author                    = 'Wanzl'
    s.source                    = { :http => "#{s.homepage}/releases/download/#{s.version}/HybridlocSDK_v#{s.version}.xcframework.zip",
                                    :sha256 => 'f5f78aa9555ff3fc59fe3d72b443d2ed1c7afff500b5eec4c20a1b5b634e0cfb' }
    s.vendored_frameworks       = 'HybridlocSDK.xcframework'
    s.preserve_paths            = '*'
  end
