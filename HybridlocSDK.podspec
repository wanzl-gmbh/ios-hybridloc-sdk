Pod::Spec.new do |s|
    s.name                      = 'HybridlocSDK'
    s.version                   = '0.9.4'
    s.platform                  = :ios, '14.0'
    s.summary                   = 'An SDK to unlock trolleys via Wanzl\'s Hybridloc'
    s.homepage                  = 'https://github.com/wanzl-gmbh/ios-hybridloc-sdk'
    s.license                   = { type: 'Proprietary' }
    s.author                    = 'Wanzl'
    s.source                    = { :http => "#{s.homepage}/releases/download/#{s.version}/HybridlocSDK_v#{s.version}.xcframework.zip",
                                    :sha256 => '60934e02becda60fb48b2e9c2c652dfaacfc835613ff81ccc6654b192741881c' }
    s.vendored_frameworks       = 'HybridlocSDK.xcframework'
    s.preserve_paths            = '*'
  end