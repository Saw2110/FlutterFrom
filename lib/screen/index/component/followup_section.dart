import 'package:customstuff/widgets/dropdown/dropdown_classes.dart';
import 'package:customstuff/widgets/text_field_decoration.dart';
import 'package:customstuff/widgets/text_field_format.dart';
import 'package:flutter/material.dart';
import 'package:marketing/constant/colors.dart';
import 'package:marketing/constant/fonts.dart';
import 'package:marketing/model/dropdown_model.dart';
import 'package:marketing/state/index_state.dart';
import 'package:marketing/widget/dropdown/dropdown_menu.dart';
import 'package:provider/provider.dart';

class FollowUpSection extends StatelessWidget {
  const FollowUpSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<IndexState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(children: [
          Checkbox(
              value: state.isFollowUpInformation,
              activeColor: primaryColor,
              onChanged: (value) {
                state.getFollowUpInformation = value!;
              }),
          Flexible(
              child: Text(
            "Follow Up Information",
            style: kTitleText.copyWith(decoration: TextDecoration.underline),
          ))
        ]),
        if (state.isFollowUpInformation)
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Flexible(
                child: TextFieldFormat(
                  textFieldName: 'Quote Price *',
                  textFormField: TextFormField(
                    controller: state.quotePriceController,
                    onChanged: (text) {
                      if (text.isNotEmpty) {
                        state.validateKey.currentState!.validate();
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required *';
                      } else {
                        return null;
                      }
                    },
                    decoration: TextFormDecoration.decoration(
                      hintText: "Enter Quote Price",
                      hintStyle: kHintText,
                      primaryColor: primaryColor,
                      borderColor: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5.0),
              Flexible(
                child: TextFieldFormat(
                  textFieldName: 'Select Follow *',
                  textFormField: CustomDropDown<DropDownDataModel>(
                    borderColor: Colors.white,
                    primaryColor: primaryColor,
                    fillColor: dropDownFillColor,
                    items: state.selectFollowList.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: DropDownMenuText(item: item.name),
                      );
                    }).toList(),
                    hint: 'Select Follow',
                    onChanged: (DropDownDataModel? text) {
                      state.validateKey.currentState!.validate();
                      state.getFollow = text!.id;
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Required *';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ]),
            Row(children: [
              Flexible(
                child: TextFieldFormat(
                    textFieldName: "Select Date *",
                    textFormField: TextFormField(
                      controller: state.followDateController,
                      style: const TextStyle(fontSize: 13.0),
                      onTap: () {
                        state.selectDate(
                            context: context, filterFrom: 'Follow');
                      },
                      onChanged: (text) {
                        if (text.isNotEmpty) {
                          state.validateKey.currentState!.validate();
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required *';
                        } else {
                          return null;
                        }
                      },
                      readOnly: true,
                      decoration: TextFormDecoration.decoration(
                        hintText: "Select Date",
                        hintStyle: kHintText,
                        borderColor: Colors.white,
                        primaryColor: primaryColor,
                      ),
                    )),
              ),
              const SizedBox(width: 10.0),
              Flexible(
                child: TextFieldFormat(
                  textFieldName: 'Follow Time *',
                  textFormField: TextFormField(
                    controller: state.followTimeController,
                    onChanged: (text) {
                      if (text.isNotEmpty) {
                        state.validateKey.currentState!.validate();
                      }
                    },
                    onTap: () {
                      state.getTime(context: context, filterFrom: "Follow");
                    },
                    readOnly: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required *';
                      } else {
                        return null;
                      }
                    },
                    decoration: TextFormDecoration.decoration(
                      hintText: "Enter Follow Time",
                      hintStyle: kHintText,
                      primaryColor: primaryColor,
                      borderColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
            TextFieldFormat(
              textFieldName: 'Select Staff *',
              textFormField: CustomDropDown<DropDownDataModel>(
                borderColor: Colors.white,
                primaryColor: primaryColor,
                fillColor: dropDownFillColor,
                items: state.staffList.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: DropDownMenuText(item: item.name),
                  );
                }).toList(),
                hint: 'Select Staff',
                onChanged: (DropDownDataModel? text) {
                  state.validateKey.currentState!.validate();
                  state.getFollowStaff = text!.id;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Required *';
                  }
                  return null;
                },
              ),
            ),
            TextFieldFormat(
              textFieldName: 'Remark',
              textFormField: TextFormField(
                controller: state.followRemarkController,
                onChanged: (text) {
                  if (text.isNotEmpty) {
                    state.validateKey.currentState!.validate();
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Required *';
                  } else {
                    return null;
                  }
                },
                maxLines: 3,
                decoration: TextFormDecoration.decoration(
                  hintText: "Enter Remark",
                  hintStyle: kHintText,
                  primaryColor: primaryColor,
                  borderColor: Colors.white,
                ),
              ),
            ),
          ])
      ],
    );
  }
}
