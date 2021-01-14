def rx_stack
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  pod 'RxDataSources', '~> 4.0'
  pod "RxGesture"
end

def shared_pods
  rx_stack
  pod 'Kingfisher'
  pod 'ReachabilitySwift'
  pod 'Resolver', '1.1.4'
  pod 'SwiftLint', '0.39.2'
  pod 'Alamofire', '5.2'
  pod 'PureLayout', '3.1.6' 
end

target 'Discover' do
  use_frameworks!

  shared_pods

end
