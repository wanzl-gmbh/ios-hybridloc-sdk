Pod::Spec.new do |s|
    s.name                      = 'HybridlocSDK'
    s.version                   = '1.0.0'
    s.platform                  = :ios, '14.0'
    s.summary                   = 'An SDK to unlock trolleys via Wanzl\'s Hybridloc'
    s.homepage                  = 'https://github.com/wanzl-gmbh/ios-hybridloc-sdk'
    s.license                   = { type: 'Proprietary' }
    s.author                    = 'Wanzl'
    s.source                    = { :http => "#{s.homepage}/releases/download/#{s.version}/HybridlocSDK_v#{s.version}.xcframework.zip",
                                    :sha256 => '342eac068fd2b188f7b496bbff7dd99e482f95f5ebdc512f1415a2c89cb7d466' }
    s.vendored_frameworks       = 'HybridlocSDK.xcframework'
    s.preserve_paths            = '*'
  end