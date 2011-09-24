library planet_health.globals;

String api_key = '0a66e421-c755-4794-82c3-451bed8ff4fd';
String tenant_id = 'hackzurich';
String base_url = 'https://api.fitrockr.com';
String greet_url = '/v1/status/greet';
String user = '613f5ed4da309d6b0fabe0b0';
String profile_url = '/v1/users/${user}/profile';

Map<String, String> headers = {
  'Accept': 'application/json',
  'X-Tenant': tenant_id,
  'X-API-Key': api_key
};

var christof = {
  "id": "613f5ed4da309d6b0fabe0b0",
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
