import 'package:flutter/material.dart';
import 'package:for_fun/controllers/HomeLayoutController.dart';
import 'package:for_fun/values/colors.dart';
import 'package:provider/provider.dart';

class FilterMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeLayoutController _controller =
        Provider.of<HomeLayoutController>(context);

    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * .4,
      width: MediaQuery.of(context).size.width,
      child: Consumer<HomeLayoutController>(builder: (_, snapshot, __) {
        return Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                padding: EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.center,
                child: DropdownButton(
                  hint: Text("Category"),
                  style: TextStyle(
                    color: AppColors.PrimaryText,
                  ),
                  isExpanded: true,
                  onChanged: (String newValue) {
                    _controller.changeCategoryDropDown(newValue);
                  },
                  value: snapshot.selectedCategory,
                  iconEnabledColor: AppColors.PrimaryElement,
                  focusColor: AppColors.PrimaryElement,
                  items: _controller.categoriesFilter
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                padding: EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.center,
                child: DropdownButton(
                  hint: Text("AGE"),
                  style: TextStyle(
                    color: AppColors.PrimaryText,
                  ),
                  isExpanded: true,
                  onChanged: (String newValue) {
                    _controller.changeAgeDropDown(newValue);
                  },
                  value: snapshot.selectedAge,
                  iconEnabledColor: AppColors.PrimaryElement,
                  focusColor: AppColors.PrimaryElement,
                  items: _controller.ageFilter
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                padding: EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.center,
                child: DropdownButton(
                  hint: Text("Gender"),
                  style: TextStyle(
                    color: AppColors.PrimaryText,
                  ),
                  isExpanded: true,
                  onChanged: (String newValue) {
                    _controller.changeGenderDropDown(newValue);
                  },
                  value: snapshot.selectedGender,
                  iconEnabledColor: AppColors.PrimaryElement,
                  focusColor: AppColors.PrimaryElement,
                  items: _controller.genderFilter
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                padding: EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.center,
                child: DropdownButton(
                  hint: Text("Season"),
                  style: TextStyle(
                    color: AppColors.PrimaryText,
                  ),
                  isExpanded: true,
                  onChanged: (String newValue) {
                    _controller.changeSeasonDropDown(newValue);
                  },
                  value: snapshot.selectedSeason,
                  iconEnabledColor: AppColors.PrimaryElement,
                  focusColor: AppColors.PrimaryElement,
                  items: _controller.seasonFilter
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                padding: EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.center,
                child: DropdownButton(
                  hint: Text("Year"),
                  style: TextStyle(
                    color: AppColors.PrimaryText,
                  ),
                  isExpanded: true,
                  onChanged: (String newValue) {
                    _controller.changeYearDropDown(newValue);
                  },
                  value: snapshot.selectedYear,
                  iconEnabledColor: AppColors.PrimaryElement,
                  focusColor: AppColors.PrimaryElement,
                  items: _controller.yearFilter
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
                child: FlatButton(
                    onPressed: () {
                      _controller.setOptions(FilterOptions(
                        category: snapshot.selectedCategory,
                        age: snapshot.selectedAge,
                        gender: snapshot.selectedGender,
                        season: snapshot.selectedSeason,
                        year: snapshot.selectedYear,
                      ));
                    },shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.SecondaryBackGround,width: 1)
        ),
                    child: Text(
                      "SEARCH",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.SecondaryText),
                    )))
          ],
        );
      }),
    );
  }
}
