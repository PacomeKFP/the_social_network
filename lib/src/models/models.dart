library models;

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:the_social_network/src/core/configs/constants.dart';

part 'post.model.dart';
part 'comment.model.dart';

class Model {
  static Future? fetch(String url) async {
    var res = await http.get(Uri.parse(url)).then((response) {
      if (response.statusCode != 200) {
        return null;
      }
      return json.decode(response.body);
    });

    return res;
  }
}
