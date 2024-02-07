library dependency_with_assets;

import 'package:flutter/material.dart';

class WidgetFromDependencyDependentOnAsset extends StatelessWidget {
  const WidgetFromDependencyDependentOnAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(color: Colors.redAccent),
      child: Image.asset('packages/dependency_with_assets/asset-from-dependency-pubspec.png'),
    );
  }
}
