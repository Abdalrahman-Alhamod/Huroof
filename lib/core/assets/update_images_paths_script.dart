// ignore_for_file: avoid_print

import 'dart:io';

void main() {
  final dir = Directory('assets/images');
  final images =
      dir
          .listSync(recursive: true)
          .whereType<File>()
          .where(
            (file) =>
                file.path.endsWith('.png') ||
                file.path.endsWith('.jpg') ||
                file.path.endsWith('.jpeg') ||
                file.path.endsWith('.gif'),
          )
          .map((file) => file.path.replaceAll('\\', '/'))
          .toList();

  final buffer = StringBuffer();
  buffer.writeln('class ImagePaths {');
  buffer.writeln('  const ImagePaths._();');
  buffer.writeln('  static const List<String> all = [');

  for (var path in images) {
    buffer.writeln('    \'$path\',');
  }

  buffer.writeln('  ];');
  buffer.writeln('}');

  File('lib/core/assets/image_paths.dart').writeAsStringSync(buffer.toString());
  print('Image paths Dart class generated.');
}
