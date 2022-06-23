import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/shared/app.dart';

void main() {
  runApp(ProviderScope(child: const AppWidget()));
}
