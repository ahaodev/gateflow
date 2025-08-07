# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

GateFlow is a cross-platform Flutter application that serves as a device relay service, supporting Windows, Linux, macOS, and web platforms. The application provides real-time monitoring and management of connected devices through a responsive dashboard interface.

## Development Commands

### Building
- **Web build (HTML renderer)**: `flutter build web --web-renderer html`
- **General build**: `flutter build <platform>`
- **Development run**: `flutter run`

### Testing and Analysis
- **Run tests**: `flutter test`
- **Analyze code**: `flutter analyze`
- **Check dependencies**: `flutter pub deps`

### Package Management
- **Install dependencies**: `flutter pub get`
- **Upgrade packages**: `flutter pub upgrade`

## Architecture Overview

### State Management
- Uses **Provider pattern** for state management with two main controllers:
  - `MenuItemController` (lib/controllers/MenuItemController.dart) - manages drawer/menu state
  - `ThemeController` (lib/controllers/ThemeController.dart) - handles light/dark theme switching

### Application Structure
- **Main Entry**: `lib/main.dart` - sets up MultiProvider with controllers
- **Main Screen**: `lib/screens/main/main_screen.dart` - contains responsive layout with side menu and page navigation
- **Five Core Screens**:
  - Dashboard (`lib/screens/dashboard/`) - primary monitoring interface with real-time data
  - Test (`lib/screens/test/`) - testing functionality
  - Setting (`lib/screens/setting/`) - configuration management
  - Voice (`lib/screens/voice/`) - voice-related features  
  - Bind (`lib/screens/bind/`) - device binding functionality

### Responsive Design
- **Responsive breakpoints** (lib/responsive.dart):
  - Mobile: < 850px width
  - Tablet: 850px - 1100px width  
  - Desktop: >= 1100px width
- Side menu shows as drawer on mobile/tablet, fixed sidebar on desktop

### Data Layer
- **Models** (lib/models/): JSON-serializable entities for API responses
- **HTTP Client**: Dio-based HTTP utility (lib/utils/http.dart) with CORS configuration
- **API Manager**: HttpManager (lib/net/http.dart) provides typed API methods
- **WebSocket**: Real-time communication for dashboard updates using WebSocketChannel

### Real-time Features
- Dashboard connects to WebSocket at `ws://127.0.0.1:8888/ws/flow` (configurable in constants.dart)
- Event logging with LinkedList-based circular buffer
- Real-time hardware monitoring and device status updates

## Configuration

### API Endpoints
- **Base URL**: `http://127.0.0.1:8888` (development)
- **WebSocket**: `ws://127.0.0.1:8888/ws/flow`
- Additional service URLs for ICBC and EMCS integrations
- All endpoints configurable in `lib/constants.dart`

### Localization
- Supports Chinese (zh_CH) and English (en_US)
- Default locale: Chinese
- Uses Flutter's internationalization framework

### Theming
- Dynamic light/dark theme switching
- Theme state persisted via API calls
- Custom color scheme defined in constants.dart

## Key Dependencies
- **flutter_localizations**: Internationalization support
- **provider**: State management
- **dio**: HTTP client with interceptors
- **fl_chart**: Data visualization and charts
- **data_table_2**: Enhanced data table components
- **web_socket_channel**: Real-time WebSocket communication
- **flutter_svg**: SVG asset handling
- **google_fonts**: Custom typography

## Development Notes
- The app starts with LoginScreen and navigates to MainScreen after authentication
- PageView with vertical scrolling disabled is used for screen navigation
- Custom fonts (SourceHanSansCN-Regular.ttf) included for Chinese text rendering
- Comprehensive asset management for icons and images in assets/ directory