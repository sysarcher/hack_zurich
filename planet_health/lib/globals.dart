library planet_health.globals;

import 'package:flutter_dotenv/flutter_dotenv.dart';

//const String api_key = '0a66e421-c755-4794-82c3-451bed8ff4fd';
String? apiKey = dotenv.env['API_KEY'];
const String TENANT_ID = 'hackzurich';
const String base_url = 'https://api.fitrockr.com';
const String greet_url = '/v1/status/greet';
const String user = '614ee7aa9187a32ff31d85c5';
const String profile_url = '/v1/users/$user/profile';
const String heart_url =
    '/v1/users/$user/heartRate?startDate=2021-09-25&endDate=2021-09-26';
const String daily_summary_uri =
    '/v1/users/$user/dailySummaries?startDate=2021-09-25&endDate=2021-09-26';

Map<String, String> headers = {
  'Accept': 'application/json',
  'X-Tenant': TENANT_ID,
  'X-API-Key':
      '' //dotenv.env['API_KEY'], //if(api_key != null ? api_key : 'NULL';
};

int heartRate = 77;
int heartRateHigh = 97;
int heartRateLow = 57;
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

var christof = {
  "id": "614ee7aa9187a32ff31d85c5",
  "firstName": "HackZurich",
  "lastName": "Test06",
  "basalMetabolism": 1783,
  "gender": "m",
  "country": "DE",
  "city": null,
  "language": "en",
  "timeZone": "Etc/GMT+1",
  "email": "test06_hackzurich@company.com",
  "yearOfBirth": 1990,
  "height": 180,
  "heightUOM": "cm",
  "weight": 75,
  "weightUOM": "kg",
  "lastSync": null,
  "trackerName": null,
  "active": true,
  "usualSleepStartTime": null,
  "usualSleepEndTime": null,
  "imperialUnits": false
};
