import 'dart:io';

import 'package:args/args.dart';
import 'package:image/image.dart';

const input = 'input';
const output = 'output';
const radius = 'radius';

void main(List<String> arguments) {
  exitCode = 0; // presume success
  final parser = ArgParser()
    ..addOption(input, mandatory: true, abbr: 'i')
    ..addOption(output, mandatory: true, abbr: 'o')
    ..addOption(radius, mandatory: false, abbr: 'r');

  ArgResults argResults = parser.parse(arguments);
  print(argResults);
  _transform(argResults[input], argResults[output], int.parse(argResults[radius] ?? '25'));
}

_transform(String input, String output, int radius) {
  final Image image = decodeImage(File(input).readAsBytesSync())!;
  final Image grayscaled = gaussianBlur(image, radius: (radius / 3).floor());
  File(output).writeAsBytesSync(encodeJpg(grayscaled));
}
