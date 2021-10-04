library planet_health.globals;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

//const String api_key = '0a66e421-c755-4794-82c3-451bed8ff4fd';
String? apiKey = dotenv.env['API_KEY'];
const String TENANT_ID = 'hackzurich';
const String base_url = 'https://api.fitrockr.com';
const String greet_url = '/v1/status/greet';
const String user = '613dc4c9309a3f06bfa716ee';
const String profile_url = '/v1/users/$user/profile';
const String heart_url =
    '/v1/users/$user/heartRate?startDate=2021-10-04&endDate=2021-10-04';
const String daily_summary_uri =
    '/v1/users/$user/dailySummaries?startDate=2021-10-04&endDate=2021-10-04';

Map<String, String> headers = {
  'Accept': 'application/json',
  'X-Tenant': TENANT_ID,
  'X-API-Key':
      '' //dotenv.env['API_KEY'], //if(api_key != null ? api_key : 'NULL';
};

final heartRateProvider = StateProvider((ref) => 0);

int heartRate = 0;
int heartRateHigh = 0;
int heartRateLow = 60;
int weight = 55;
int dailyCals = 1000;
int dailySteps = 1000;
double dailyKm = 1.5;

class EnergyMap {
  String name = '';
  int calories = 0;
  int co2 = 0;

  EnergyMap(String name, int calories, int co2) {
    this.name = name;
    this.calories = calories;
    this.co2 = co2;
  }
}

var bread = EnergyMap("Bread", 66, 120);
var beef = EnergyMap("Beef", 348, 30000);
var salmon = EnergyMap("Salmon", 115, 2500);
var tofu = EnergyMap("Tofu", 77, 150);
var milk = EnergyMap("Milk", 122, 280);
var water = EnergyMap("Water", 0, 5);
List<EnergyMap> day1 = [bread, beef, salmon];
List<EnergyMap> day2 = [tofu, milk, water];
int totalCo2e = 0;

var energyMap = {
  'white_bread': {
    'name': 'White Bread',
    'calories': 66,
    'co2': 120,
  },
  'beef': {
    'name': 'Beef',
    'calories': 30000,
  },
};
