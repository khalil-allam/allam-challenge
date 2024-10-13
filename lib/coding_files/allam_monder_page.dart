import 'dart:convert';

import 'package:allam_challenge/coding_files/shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final String inputText;
  HomeScreen({super.key, required this.inputText});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String API_TOKEN = dotenv.env['apikey']!;

class _HomeScreenState extends State<HomeScreen> {
  var input = TextEditingController();
  var output = TextEditingController();

  void generateAllamText(String inputData) async {
    {
      String inputText = inputData;
      var jwtToken = SharedPref.sharedPref.getString('jwt');
      print(jwtToken);
      if (jwtToken != null) {
        if (JwtDecoder.isExpired(jwtToken)) {
          var jwtToken = await getAccessToken(apikey: API_TOKEN);
          if (jwtToken != null) {
            await sendInput(accessToken: jwtToken, input: inputText);
          }
        } else {
          await sendInput(accessToken: jwtToken, input: inputText);
        }
      } else {
        var jwtToken = await getAccessToken(apikey: API_TOKEN);
        if (jwtToken != null) {
          await sendInput(accessToken: jwtToken, input: inputText);
        }
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateAllamText(widget.inputText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text('اكتب سؤالك'),
              TextFormField(
                controller: input,
              ),
              MaterialButton(
                onPressed: () async {
                  String inputText = input.text;
                  var jwtToken = SharedPref.sharedPref.getString('jwt');
                  print(jwtToken);
                  if (jwtToken != null) {
                    if (JwtDecoder.isExpired(jwtToken)) {
                      var jwtToken = await getAccessToken(apikey: API_TOKEN);
                      if (jwtToken != null) {
                        await sendInput(
                            accessToken: jwtToken, input: inputText);
                      }
                    } else {
                      await sendInput(accessToken: jwtToken, input: inputText);
                    }
                  } else {
                    var jwtToken = await getAccessToken(apikey: API_TOKEN);
                    if (jwtToken != null) {
                      await sendInput(accessToken: jwtToken, input: inputText);
                    }
                  }
                },
                child: const Text('ارسال'),
              ),
              const Text('الاجابة'),
              TextFormField(
                readOnly: true,
                controller: output,
                minLines: 4,
                maxLines: null,
                textDirection: TextDirection.rtl,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> getAccessToken({required String apikey}) async {
    final dio = Dio();

    String url = 'https://iam.cloud.ibm.com/identity/token';
    String _apiKey = apikey;

    final data = {
      'grant_type': 'urn:ibm:params:oauth:grant-type:apikey',
      'apikey': _apiKey
    };

    try {
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Accept': '*/*',
          },
        ),
        data: data,
      );

      print(response.data);
      // final json = jsonDecode(response.data);
      await SharedPref.sharedPref
          .setString('jwt', response.data['access_token']);
      return response.data['access_token'];
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<void> sendInput(
      {required String accessToken, required String input}) async {
    final dio = Dio();

    String url =
        'https://eu-de.ml.cloud.ibm.com/ml/v1/text/generation?version=2023-05-29';
    final token = accessToken;

    final data = {
      "input": "[INST] $input [/INST]",
      // "input": input,
      "parameters": {
        "decoding_method": "greedy",
        "max_new_tokens": 900,
        "min_new_tokens": 0,
        "stop_sequences": [],
        "repetition_penalty": 1
      },
      "model_id": "sdaia/allam-1-13b-instruct",
      "project_id":
          "93c51780-827a-4c8b-9887-4ec683746ef9" //93c51780-827a-4c8b-9887-4ec683746ef9
    };

    try {
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: data,
      );

      print(response.data);
      output.text = response.data['results'][0]['generated_text'];
    } catch (e) {
      print('Error: $e');
    }
  }
}
