Pod::Spec.new do |s|
    s.name                      = 'HybridlocSDK'
    s.version                   = '1.0.0'
    s.platform                  = :ios, '14.0'
    s.summary                   = 'An SDK to unlock trolleys via Wanzl\'s Hybridloc'
    s.homepage                  = 'https://github.com/wanzl-gmbh/ios-hybridloc-sdk'
    s.license                   = { type: 'Proprietary' }
    s.author                    = 'Wanzl'
    s.source                    = { :http => "#{s.homepage}/releases/download/#{s.version}/HybridlocSDK_v#{s.version}.xcframework.zip",
                                    :sha256 => '67341b78f31770495793e7d8d26809946c6e24451fd0f3328dcd0f61ea0629db' }
    s.vendored_frameworks       = 'HybridlocSDK.xcframework'
    s.preserve_paths            = '*'
  end