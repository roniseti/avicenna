import 'package:flutter_test/flutter_test.dart';

import 'package:avicenna/avicenna.dart';

void main() {
  test('adds one to input values', () {
    final halo = Halo();
    expect(halo.greet('Imas'), 'Halo Imas');
    expect(halo.greet('Sumsum'), 'Halo Sumsum');
    expect(halo.greet('Ida'), 'Halo Ida');
  });
}
