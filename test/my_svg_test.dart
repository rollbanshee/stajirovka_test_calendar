import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:stajirovka_test/features/resources/resources.dart';

void main() {
  test('my_svg assets test', () {
    expect(File(MySvg.calendar).existsSync(), isTrue);
    expect(File(MySvg.diary).existsSync(), isTrue);
    expect(File(MySvg.statistics).existsSync(), isTrue);
  });
}
