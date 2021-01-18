import 'package:flutter/material.dart';
import 'package:for_fun/controllers/addressDetailsController.dart';
import 'package:for_fun/values/colors.dart';
import 'package:provider/provider.dart';

class AddressDetails extends StatefulWidget {
  @override
  _AddressDetailsState createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  TextEditingController _addressDetails;
  AddressDetailsController _controller;

  @override
  void initState() {
    _controller = new AddressDetailsController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddressDetailsController>(
        create: (_) => new AddressDetailsController(),
        child: _addressInfo());
  }

  Widget _addressInfo() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(color: AppColors.SecondaryBackGround,borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Consumer<AddressDetailsController>(
        builder: (_, snapshot, __) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    hint: Text("City"),
                    style: TextStyle(
                      color: AppColors.PrimaryText,
                    ),
                    isExpanded: true,
                    onChanged: (String newValue) {
                      _controller.changeCityDropDown(newValue);
                    },
                    value: snapshot.selectedCity,
                    iconEnabledColor: AppColors.PrimaryElement,
                    focusColor: AppColors.PrimaryElement,
                    items: _controller.cities
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
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    hint: Text("Area"),
                    style: TextStyle(
                      color: AppColors.PrimaryText,
                    ),
                    isExpanded: true,
                    onChanged: (String newValue) {
                      _controller.changeAreaDropDown(newValue);
                    },
                    value: snapshot.selectedArea,
                    iconEnabledColor: AppColors.PrimaryElement,
                    focusColor: AppColors.PrimaryElement,
                    items: _controller.areas
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
              Flexible(
                child: TextField(

                  cursorColor: AppColors.PrimaryElement,
                  controller: _addressDetails,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      hintStyle: TextStyle(color:AppColors.PrimaryText,fontSize: 14,fontWeight: FontWeight.w400),
                      hintText: "Address details",
                      hoverColor: AppColors.SecondaryElement),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
