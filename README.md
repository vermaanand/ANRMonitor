# 🔍 ANRMonitor: Lightweight iOS SDK for Real-Time ANR Detection

ANRMonitor is a lightweight, production-ready iOS SDK that helps you detect App Not Responding (ANR) issues in real-time with high accuracy and minimal overhead. It leverages CFRunLoopObserver to monitor the main thread’s responsiveness — with zero dependency on timers or background threads, ensuring maximum reliability even in release builds.

## ANR Flow Diagram

![ANR Flow](https://github.com/vermaanand/ANRMonitor/blob/main/ANRDetector/Assets/flow.png?raw=true)

---

## 🚀 Key Features

✅ Real-Time ANR Detection: Catch unresponsive UI threads as they happen.

🔄 RunLoop-Based Monitoring: Uses native CFRunLoop observers to detect UI hangs — no polling or scheduled timers.

📦 Lightweight: Minimal footprint; easily pluggable into any iOS app.

🔧 Customizable Thresholds: Configure ANR sensitivity to suit your app’s responsiveness needs.

🧪 Safe for Production: No performance degradation; works silently in the background.



---

## 🛠 Installation

### ➤ Using Swift Package Manager (SPM)

In **Xcode**:

1. Go to `File` → `Add Packages…`
2. Enter the URL: https://github.com/vermaanand/ANRMonitor


3. Choose version/tag: `1.0.1`

---

### ➤ Using CocoaPods

Add the following to your `Podfile`:

```ruby
pod 'ANRMonitor', :git => 'https://github.com/vermaanand/ANRMonitor.git', :tag => '1.0.0'

```

Then run:
```ruby

pod install

```


### ➤ 🧠 Usage
Import the module:

```ruby
import ANRMonitor

```

Start monitoring:

```ruby

ANRMonitor.shared.startMonitoring { report in
    // Handle the ANR report (log, send to backend, etc.)
    print("ANR Detected at \(report.date)")
    print(report.mainThreadStack.joined(separator: "\n"))
}

```

To stop monitoring:

```ruby
ANRMonitor.shared.stopMonitoring()
```

Customize the threshold:

```ruby
let monitor = ANRMonitor(threshold: 2.0) // in seconds
monitor.startMonitoring { report in
    // Handle ANR
}

```


---


📄 License
MIT License. See LICENSE for details.

```ruby
👤 Author
Anand Verma
GitHub: @vermaanand
Email: vermaanand607@gmail.com

```


💡 Contributions 
Pull requests and issues are welcome. Let’s make mobile apps smoother together!

Let me know if you’d like:

✅ Shields (e.g., version, platform, license)

📊 Diagrams or architecture images

✏️ Sample test cases or demo app setup

Ready to go live! ✅
