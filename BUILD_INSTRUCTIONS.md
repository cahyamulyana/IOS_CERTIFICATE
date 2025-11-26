# 📱 Build Instructions - Android & iOS

## ✅ Yang Sudah Diperbaiki:
1. ✅ Biometric support di semua browser Android/iOS
2. ✅ Camera permission auto-fix (tanpa audio)
3. ✅ Device binding (1 HP = 1 Pegawai)
4. ✅ GPS optimization
5. ✅ Auto-inject device_id ke semua request

## 🔨 Build Android APK

### 1. Install Dependencies
```bash
cd cordova_project
npm install -g cordova
cordova platform add android
```

### 2. Build APK
```bash
cordova build android --release
```

### 3. Sign APK (Optional)
```bash
# Generate keystore (first time only)
keytool -genkey -v -keystore sispeg.keystore -alias sispeg -keyalg RSA -keysize 2048 -validity 10000

# Sign APK
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore sispeg.keystore platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk sispeg

# Zipalign
zipalign -v 4 platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk sispeg_mobile_v2.apk
```

### 4. Output
APK Location: `platforms/android/app/build/outputs/apk/release/app-release.apk`

## 🍎 Build iOS IPA

### 1. Install Dependencies
```bash
cd cordova_project
cordova platform add ios
```

### 2. Build IPA
```bash
cordova build ios --release
```

### 3. Open in Xcode
```bash
open platforms/ios/SISPEG\ Mobile.xcworkspace
```

### 4. Sign & Export
- Open Xcode
- Select your Apple Developer account
- Archive → Export → Ad Hoc/App Store

### 5. Output
IPA Location: Export from Xcode

## 📦 Quick Build (Tanpa Sign)

### Android
```bash
cd cordova_project
cordova build android
```
Output: `platforms/android/app/build/outputs/apk/debug/app-debug.apk`

### iOS
```bash
cd cordova_project
cordova build ios
```
Output: Open in Xcode for testing

## 🧪 Test di Device

### Android
```bash
# Install via USB
adb install platforms/android/app/build/outputs/apk/debug/app-debug.apk

# Or drag & drop APK to device
```

### iOS
```bash
# Run on connected device
cordova run ios --device
```

## 📝 File Structure
```
cordova_project/
├── www/
│   ├── index.html              # Landing page
│   └── js/
│       └── android-ios-fix.js  # Optimization script
├── config.xml                  # Cordova config + permissions
└── BUILD_INSTRUCTIONS.md       # This file
```

## ⚙️ Features Included

### 1. Biometric Support
- Auto-detect fingerprint/Face ID
- Fallback to PIN if not available
- Works on all Android/iOS browsers

### 2. Camera Optimization
- Remove audio permission (fix Android error)
- Auto-request camera permission
- Optimize for mobile resolution

### 3. Device Binding
- Generate unique device_id
- Store in localStorage
- Auto-inject to all API requests
- Enforce 1 device per employee

### 4. GPS Optimization
- High accuracy mode
- 30 second timeout
- 10 second cache

### 5. Screen Wake Lock
- Prevent screen sleep during attendance
- Auto-release after completion

## 🚀 Deploy

### Upload APK
1. Copy `app-release.apk` to server
2. Update download link: `http://sispeg.sistemkeuangan.com/mobile/sispeg_mobile_v2.apk`

### Upload IPA
1. Export IPA from Xcode
2. Upload to server or TestFlight
3. Update download link

## 🐛 Troubleshooting

### Camera Error
- Check AndroidManifest.xml has CAMERA permission
- Verify android-ios-fix.js is loaded
- Test on real device (not emulator)

### Biometric Not Working
- Check device has fingerprint/Face ID enabled
- Verify USE_BIOMETRIC permission in manifest
- Test PublicKeyCredential API

### Device Binding Error
- Check localStorage is working
- Verify device_id is generated
- Check server receives device_id in request

### GPS Error
- Enable location services on device
- Grant location permission to app
- Test in open area (not indoors)

## 📞 Support
Contact: admin@sistemkeuangan.com
