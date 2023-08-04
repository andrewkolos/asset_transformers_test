import 'dart:io';

import 'package:args/args.dart';
import 'package:image/image.dart';

const input = 'input';
const output = 'output';

void main(List<String> arguments) {
  exitCode = 0; // presume success
  final parser = ArgParser()
    ..addOption(input, mandatory: true, abbr: 'i')
    ..addOption(output, mandatory: true, abbr: 'o');

  ArgResults argResults = parser.parse(arguments);
  _transform(argResults[input], argResults[output]);
}

_transform(String input, String output) {
  final Image image = decodeImage(File(input).readAsBytesSync())!;
  final Image grayscaled = grayscale(image);
  File(output).writeAsBytesSync(encodeJpg(grayscaled));
}
