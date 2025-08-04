Pod::Spec.new do |spec|
  spec.name         = "ANRMonitor"
  spec.version      = "1.0.0"
  spec.summary      = "Lightweight and production-ready iOS SDK to detect ANRs (App Not Responding) using RunLoop."
  spec.description  = <<-DESC
    ANRMonitor is a lightweight iOS library to detect ANRs (application not responding) in real-time
    using RunLoop observers without timers. It can be integrated with logging systems like Crashlytics or sent to a backend.
  DESC

  spec.homepage     = "https://github.com/vermaanand/ANRMonitor"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "ANRMonitor" => "vermaanand607@gmail.com" }

  spec.platform     = :ios, "13.0"

  spec.source       = { :git => "https://github.com/vermaanand/ANRMonitor.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources/ANRMonitor/**/*.swift"
  spec.exclude_files = "Sources/ANRMonitor/Info.plist"
end