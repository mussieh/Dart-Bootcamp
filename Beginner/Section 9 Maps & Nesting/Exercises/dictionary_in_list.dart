List<Map<dynamic, dynamic>> travelLog = [
  {
    "country": "France",
    "visits": 12,
    "cities": ["Paris", "Lille", "Dijon"]
  },
  {
    "country": "Germany",
    "visits": 5,
    "cities": ["Berlin", "Hamburg", "Stuttgart"]
  },
];

void addNewCountry(String country, int numberOfVisits, List<String> cities) {
  var newCountry = {};
  newCountry["country"] = country;
  newCountry["visits"] = numberOfVisits;
  newCountry["cities"] = cities;
  travelLog.add(newCountry);
}

// A program that adds a country to a travel log.
void main() {
  addNewCountry("Russia", 2, ["Moscow", "Saint Petersburg"]);
  print(travelLog);
}
