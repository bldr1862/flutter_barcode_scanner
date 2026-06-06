import 'dart:io';

import 'package:test/test.dart';

void main() {
  test('iOS plugin resolves root view controller without AppDelegate window force unwrap', () {
    final source = File('ios/Classes/SwiftFlutterBarcodeScannerPlugin.swift').readAsStringSync();

    expect(
      source,
      isNot(contains('UIApplication.shared.delegate?.window??.rootViewController)!')),
    );
    expect(source, contains('connectedScenes'));
    expect(source, contains('isKeyWindow'));
  });
}
