Pod::Spec.new do |s|
    s.name                      = 'HybridlocSDK'
    s.version                   = '0.9.5'
    s.platform                  = :ios, '14.0'
    s.summary                   = 'An SDK to unlock trolleys via Wanzl\'s Hybridloc'
    s.homepage                  = 'https://github.com/wanzl-gmbh/ios-hybridloc-sdk'
    s.license                   = { type: 'Proprietary' }
    s.author                    = 'Wanzl'
    s.source                    = { :http => "#{s.homepage}/releases/download/#{s.version}/HybridlocSDK_v#{s.version}.xcframework.zip",
                                    :sha256 => '434b9d982416d9f9b6d391d589c3d34ed7c8fdbe63dc7cea2fb85d22ce56bb44' }
    s.vendored_frameworks       = 'HybridlocSDK.xcframework'
    s.preserve_paths            = '*'
  end