import 'package:flutter/material.dart';
import 'package:for_fun/models/product.dart';
import 'package:for_fun/pages/homePage/HomeLayout/filter.dart';
import 'package:for_fun/pages/homePage/HomeLayout/filterMenu.dart';

class HomeLayoutController extends ChangeNotifier {
  Filter menu;
  FilterOptions _options;

  String selectedGender;
  String selectedAge;
  String selectedSeason;
  String selectedYear;
  String selectedCategory;

  FilterOptions get options => _options;
  List<Product> juniorProducts =[];

  List<String> categoriesFilter = [
    "All",
    "HomeWear",
    "UnderWear",
  ];

  List<String> genderFilter = [
    "All",
    "Male",
    "Female",
  ];
  List<String> seasonFilter = [
    "All",
    "Winter",
    "Summer",
  ];
  List<String> yearFilter = [
    "All",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
  ];
  List<String> ageFilter = ["All", "1", "2", "3-5", "5-10"];

  HomeLayoutController() {
    this.menu = Filter.empty;
    _options = new FilterOptions();
    for (int i = 1; i < 10; i++) {
      juniorProducts.add(Product(
          "name",
          "https://www.cowmakesmoo.com/image/cache/data/products/Boys_Girls_AW18_Snow_Owl_Crew_Tawny_530x%402x-1100x1100.jpg",
          0.0,
          i));
    }
  }

  void changeCategoryDropDown(String value) {
    selectedCategory = value;
    notifyListeners();
  }

  void changeAgeDropDown(String value) {
    selectedAge = value;
    notifyListeners();
  }

  void changeGenderDropDown(String value) {
    selectedGender = value;
    notifyListeners();
  }

  void changeSeasonDropDown(String value) {
    selectedSeason = value;
    notifyListeners();
  }

  void changeYearDropDown(String value) {
    selectedYear = value;
    notifyListeners();
  }

  void setOptions(FilterOptions value) {
    _options=value;
    /*print(options.age);
    print(options.gender);
    print(options.season);
    print(options.year);
    print("----");
     */
    if (value.age == null&&
        value.gender == null &&
        value.season == null &&
         value.year == null&&
    value.category==null
    ) {
      menu = Filter.empty;
    } else {
      menu = Filter.filter;
    }
    notifyListeners();
  }

  void openMenu() {
    menu = Filter.open;
    notifyListeners();
  }

  void closeMenu() {
    setOptions(_options);
  }

  void openCloseMenu() {
    if (menu == Filter.open) {
      closeMenu();
    } else {
      openMenu();
    }
  }

  Widget getMenu() {
    switch (menu) {
      case Filter.open:
        return FilterMenuWidget();
        break;
      case Filter.empty:
        return Container();
        break;
      case Filter.filter:
        return FiltersByWidget();
        break;
      default:
        return Container();
    }
  }

  void initCategory() {
    setOptions(FilterOptions(
      category: null,
      age: this.options.age,
      gender: this.options.gender,
      season: this.options.season,
      year: this.options.year,
    ));
    selectedCategory=null;
    notifyListeners();
  }

  void initAge() {
    setOptions(FilterOptions(
      category: this.options.category,
        age: null,
        gender: this.options.gender,
        season: this.options.season,
        year: this.options.year,
    ));
    selectedAge=null;
    notifyListeners();
  }

  void initGender() {
    setOptions(FilterOptions(
      category: this.options.category,
      age: this.options.age,
      gender: null,
      season: this.options.season,
      year: this.options.year,
    ));
    selectedGender=null;
    notifyListeners();
  }
  void initSeason() {
    setOptions(FilterOptions(
      category: this.options.category,
      age: this.options.age,
      gender: this.options.gender,
      season: null,
      year: this.options.year,
    ));
    selectedSeason=null;
    notifyListeners();
  }
  void initYear() {
    setOptions(FilterOptions(
      category: this.options.category,
      age: this.options.age,
      gender: this.options.gender,
      season: this.options.season,
      year: null,
    ));
    selectedYear=null;
    notifyListeners();
  }
}

enum Filter { open, empty, filter }

class FilterOptions {
  String category;
  String age;
  String gender;
  String season;
  String year;

  FilterOptions({this.category,this.age, this.gender, this.season, this.year});
}
