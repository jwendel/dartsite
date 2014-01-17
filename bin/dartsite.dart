import 'package:args/args.dart';
import 'dart:io';
import 'dart:convert';

void log(var message) {

}

void main(List<String> args) {
  ArgParser parser = new ArgParser();
  parser.addFlag("add", abbr: "a");
  ArgResults result = parser.parse(args);

  List<String> files = result.rest;
  print("Args: ${files}");

  files.forEach((String name)
      {
        File f = new File(name);
        processFile(f);
      }
  );
}

processFile(File f) {
  var data = f.openRead();
  data.transform(UTF8.decoder)
    .transform(new LineSplitter())
      .listen((String line) {
        print(line);
      }).asFuture().catchError((o) => print("error: ${o}"));
}

