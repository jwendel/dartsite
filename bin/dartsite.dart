import 'package:args/args.dart';

void main(List<String> args) {
  ArgParser parser = new ArgParser();
  parser.addFlag("add", abbr: "a");
  ArgResults result = parser.parse(args);

  List<String> files = result.rest;
  print(files);
}
