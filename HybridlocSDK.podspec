Pod::Spec.new do |s|
    s.name                      = 'HybridlocSDK'
    s.version                   = '0.9.6'
    s.platform                  = :ios, '14.0'
    s.summary                   = 'An SDK to unlock trolleys via Wanzl\'s Hybridloc'
    s.homepage                  = 'https://github.com/wanzl-gmbh/ios-hybridloc-sdk'
    s.license                   = { type: 'Proprietary' }
    s.author                    = 'Wanzl'
    s.source                    = { :http => "#{s.homepage}/releases/download/#{s.version}/HybridlocSDK_v#{s.version}.xcframework.zip",
                                    :sha256 => '2cf894b2b11476e7ac861dd5f4dc74140329e65e820137b6a554cf6d5e5ff14c' }
    s.vendored_frameworks       = 'HybridlocSDK.xcframework'
    s.preserve_paths            = '*'
  end