library planet_health.globals;

String api_key = '0a66e421-c755-4794-82c3-451bed8ff4fd';
String tenant_id = 'hackzurich';
String base_url = 'https://api.fitrockr.com';
String greet_url = '/v1/status/greet';
String user = '614ee7aa9187a32ff31d85c5';
String profile_url = '/v1/users/${user}/profile';
String heart_url =
    '/v1/users/${user}/heartRate?startDate=2021-09-25&endDate=2021-09-26';
String daily_summary_uri =
    '/v1/users/${user}/dailySummaries?startDate=2021-09-25&endDate=2021-09-26';

Map<String, String> headers = {
  'Accept': 'application/json',
  'X-Tenant': tenant_id,
  'X-API-Key': api_key
};

int heart_rate = 77;
int heart_rate_high = 97;
int heart_rate_low = 57;
int weight = 55;
int daily_cals = 1000;
int daily_steps = 1000;
double daily_km = 1.5;

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
int total_co2e = 0;

var energy_map = {
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
