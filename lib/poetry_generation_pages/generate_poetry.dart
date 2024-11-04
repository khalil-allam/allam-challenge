import 'package:allam_challenge/coding_files/color_pallete.dart';
import 'package:allam_challenge/poetry_generation_pages/create_poetry.dart';
import 'package:allam_challenge/poetry_generation_pages/output_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:lottie/lottie.dart';

import '../coding_files/allam_monder_page.dart';
import '../coding_files/shared_pref.dart';

class GeneratePoetry extends StatefulWidget {
  final String generatedText;
  final String poetry_service_type;
  const GeneratePoetry({super.key, required this.generatedText, required this.poetry_service_type});

  @override
  State<GeneratePoetry> createState() => _GeneratePoetryState();
}

class _GeneratePoetryState extends State<GeneratePoetry> {
  String output = "";
  String system_prompt = "";

  void generateAllamText(String inputData) async {
    {
      String inputText = inputData;
      var jwtToken = SharedPref.sharedPref.getString('jwt');
      // print(jwtToken);
      try {
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
      } catch (e) {
        Navigator.pop(context);
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'حدث خطأ، يرجى المحاولة مرة أخرى',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Cairo',
              ),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateAllamText(widget.generatedText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(lottie_petry, height: 250),
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

    // try {
    final response = await dio.post(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': '*/*',
          // "Access-Control-Allow-Credentials": true,
          // 'Access-Control-Allow-Origin': '*',
          // "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          // "Access-Control-Allow-Methods": "POST, OPTIONS",
          // 'Access-Control-Allow-Origin': '*',
          // 'Access-Control-Allow-Methods': 'GET, POST',
          // 'Access-Control-Allow-Headers': 'X-Requested-With'
        },
      ),
      data: data,
    );

    // print(response.data);
    // final json = jsonDecode(response.data);
    await SharedPref.sharedPref.setString('jwt', response.data['access_token']);
    return response.data['access_token'];
    // } catch (e) {
    //   print('Error: $e');
    //   return null;
    // }
  }

  Future<void> sendInput(
      {required String accessToken, required String input}) async {
    final dio = Dio();

    String url =
        'https://eu-de.ml.cloud.ibm.com/ml/v1/text/generation?version=2023-05-29';
    final token = accessToken;
        widget.poetry_service_type == "انشاء" 
    ? system_prompt =  "<<SYS>>\nعند طلب كتابة قصيدة، تقوم بتقسيمها إلى شطرين فقط لكل بيت وكتابة عنوان للقصيدة. مثال: البيت الاول، البيت الثاني\n<</SYS>> "
    : system_prompt = "";
    final data = {
      // "input": "INST]$input [/INST]",
      "input": "INST]$system_prompt$input[/INST]",
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

    // try {
    final response = await dio.post(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          // 'Content-Type': 'text/plain',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          // "Access-Control-Allow-Credentials": true,
          // 'Access-Control-Allow-Origin': '*',
          // "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          // "Access-Control-Allow-Methods": "POST, OPTIONS",
          // 'Access-Control-Allow-Methods': 'GET, POST',
          // 'Access-Control-Allow-Headers': 'X-Requested-With'
        },
      ),
      data: data,
    );

    // print(response.data);
    setState(() {
      output = response.data['results'][0]['generated_text'];
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => OutputPage(
                outputText: output,
              )),
    );
    // } catch (e) {
    //   print('Error: $e');
    // }
  }
}
