# 📘 Gratify — A Simple & Mindful Gratitude Journal  
*A lightweight iOS app to help you slow down, reflect, and appreciate the good moments.*

Gratify is a minimalistic gratitude-journal app built with **SwiftUI**, designed to make the habit of gratitude easy, fast, and meaningful.  
Every day, write down what you’re grateful for — and let your entries stay safely on your device.

---

## 🌟 Features

### ✏️ Today View  
Write a quick gratitude note for the day.  
- Clean, distraction-free interface  
- Smart keyboard dismissal  
- “Add” button safely ignores empty entries  

### 🕰 Past Entries  
Browse your older gratitude notes.  
- Displays all entries with date + time  
- Sorted chronologically (oldest → newest)  
- Swipe-to-delete support  

### ⚙️ Settings  
A simple about screen that reminds users:  
> *“Gratify stores your notes privately on this device and works offline.”*

### 🔐 Local Persistence  
All entries are saved using `UserDefaults` with automatic JSON encoding.  
No servers, no accounts, no tracking — **your notes stay on your device**.

---

## 🧠 Architecture Overview

The project uses a clean, simple MVVM-style structure powered by SwiftUI.

### 📂 Core Components
| File | Purpose |
|------|---------|
| **GratifyApp.swift** | App entry point, injects shared `EntriesStore` as an environment object |
| **EntriesStore.swift** | ObservableObject responsible for entry list, adding, deleting, and persistence |
| **Models.swift** | Defines `GratitudeEntry` (Identifiable, Codable, Equatable) |
| **TodayView.swift** | Main input screen for daily gratitude |
| **PastEntriesView.swift** | List UI showing all past saved entries |
| **RootView.swift** | Tab bar containing Today, Past Entries, and Settings |
| **SettingsView.swift** | Static info view for privacy notice |

### 📦 Persistence  
The app stores data using:
```swift
UserDefaults.standard.set(data, forKey: "gratify.entries.v1")
