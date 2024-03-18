import 'package:flutter/material.dart';

class OverlayManager {
  static final OverlayManager _instance = OverlayManager._internal();

  factory OverlayManager() {
    return _instance;
  }

  OverlayManager._internal();

  final Map<String, OverlayEntry> overlays = {};

  void addOverlay(String key, OverlayEntry overlay) {
    overlays[key] = overlay;
  }

  void removeOverlay(String key) {
    overlays.remove(key);
  }

  void removeAllOverlays() {
    overlays.clear();
  }

  void updateOverlay(String key, OverlayEntry overlay) {
    overlays[key]?.remove();
    overlays[key] = overlay;
  }
}
