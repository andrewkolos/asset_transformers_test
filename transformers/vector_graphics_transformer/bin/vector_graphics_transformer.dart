import 'dart:io';

import 'package:args/args.dart';

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
      final ProcessResult result =  Process.runSync(
      'dart',
      <String>[
        'run',
        'vector_graphics_compiler',
        '--input=$input',
        '--output=$output'
      ],
   );

  print(result.stdout);
  if (result.exitCode != 0) {
    throw Exception (result.stdout);
  }
}
