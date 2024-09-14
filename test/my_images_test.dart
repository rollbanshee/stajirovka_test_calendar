import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:stajirovka_test/features/resources/resources.dart';

void main() {
  test('my_images assets test', () {
    expect(File(MyImages.mood1).existsSync(), isTrue);
    expect(File(MyImages.mood2).existsSync(), isTrue);
    expect(File(MyImages.mood3).existsSync(), isTrue);
    expect(File(MyImages.mood4).existsSync(), isTrue);
    expect(File(MyImages.mood5).existsSync(), isTrue);
    expect(File(MyImages.mood6).existsSync(), isTrue);
  });
}
