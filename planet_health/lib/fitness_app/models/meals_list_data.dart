class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  double kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/fitness_app/dinner.png',
      titleTxt: 'Meat',
      kacl: -5.3,
      meals: <String>['Reduction of\nmeat is\nnecessary'],
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/apple.png',
      titleTxt: 'Veggies',
      kacl: -1.1,
      meals: <String>['Eat more\nregional veggie\nand fruit!'],
      startColor: '#5cdd5c', //#738AE6
      endColor: '#5cdd6b', //#5C5EDD
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/plane.png',
      titleTxt: 'Flights',
      kacl: -5,
      meals: <String>['Avoid\ndomestic flight!'],
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/vehicle.png',
      titleTxt: 'Vehicle',
      kacl: -3.0,
      meals: <String>['Take public\ntransportation!'],
      startColor: '#bdbdc7', //#6F72CA
      endColor: '#918f9c', //#1E1466
    ),
  ];
}
