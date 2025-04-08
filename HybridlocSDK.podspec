Pod::Spec.new do |s|
    s.name                      = 'HybridlocSDK'
    s.version                   = '1.2.0'
    s.platform                  = :ios, '15.0'
    s.summary                   = 'An SDK to unlock trolleys via Wanzl\'s Hybridloc'
    s.homepage                  = 'https://github.com/wanzl-gmbh/ios-hybridloc-sdk'
    s.license                   = { :type => 'MIT' }
    s.author                    = 'Wanzl'
    s.source                    = { :http => "#{s.homepage}/releases/download/#{s.version}/HybridlocSDK_v#{s.version}.xcframework.zip",
                                    :sha256 => '3fa06da81d65156a6b114453a29c48769fb39458032e1682264f56dc7405b31f' }
    s.vendored_frameworks       = 'HybridlocSDK.xcframework'
    s.preserve_paths            = '*'
  end
