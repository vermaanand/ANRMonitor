# ANRMonitor

A lightweight and production-ready iOS SDK to detect ANRs (App Not Responding) in real-time using `RunLoop` observers — no timers involved.

---

## 🚀 Features

- Detects ANRs caused by main thread freezes.
- No timers — uses `RunLoopObserver` for accurate and efficient monitoring.
- Fully customizable threshold (default: 1.5 seconds).
- Easily integrates with Crashlytics, Sentry, or your own backend.
- Supports iOS 13.0+ and Swift 5.7+

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

This is section one.

---

This is section two.


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
