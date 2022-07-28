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

class LeadSection extends StatelessWidget {
  const LeadSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<IndexState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              "Leads Information",
              style: kTitleText.copyWith(decoration: TextDecoration.underline),
            )),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Flexible(
            child: TextFieldFormat(
              textFieldName: 'Select Source *',
              textFormField: CustomDropDown<DropDownDataModel>(
                isExpanded: true,
                borderColor: Colors.white,
                primaryColor: primaryColor,
                fillColor: dropDownFillColor,
                items: state.leadSourceList.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: DropDownMenuText(item: item.name),
                  );
                }).toList(),
                hint: 'Select Source',
                onChanged: (DropDownDataModel? text) {
                  state.validateKey.currentState!.validate();
                  state.getLeadSource = text!.id;
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
          const SizedBox(width: 5.0),
          Flexible(
            child: TextFieldFormat(
              textFieldName: 'Select Product *',
              textFormField: CustomDropDown<DropDownDataModel>(
                isExpanded: true,
                borderColor: Colors.white,
                primaryColor: primaryColor,
                fillColor: dropDownFillColor,
                items: state.leadProductList.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: DropDownMenuText(item: item.name),
                  );
                }).toList(),
                hint: 'Select Product',
                onChanged: (DropDownDataModel? text) {
                  state.validateKey.currentState!.validate();
                  state.getProduct = text!.id;
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
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Flexible(
            child: TextFieldFormat(
              textFieldName: 'Select Lead Status *',
              textFormField: CustomDropDown(
                isExpanded: true,
                borderColor: Colors.white,
                primaryColor: primaryColor,
                fillColor: dropDownFillColor,
                items: ["Success", "Pending", "Failed"].map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: DropDownMenuText(item: item),
                  );
                }).toList(),
                hint: 'Select Lead Status',
                onChanged: (String? text) {
                  state.validateKey.currentState!.validate();
                  state.getLeadStatus = text!;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select lead';
                  }
                  return null;
                },
              ),
            ),
          ),
          const SizedBox(width: 5.0),
          Flexible(
            child: TextFieldFormat(
              textFieldName: 'Select Staff *',
              textFormField: CustomDropDown<DropDownDataModel>(
                isExpanded: true,
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
                  state.getLeadStaff = text!.id;
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
                  controller: state.leadDateController,
                  style: const TextStyle(fontSize: 13.0),
                  onTap: () {
                    state.selectDate(context: context, filterFrom: 'Lead');
                  },
                  onChanged: (text) {
                    if (text.isNotEmpty) {
                      state.validateKey.currentState!.validate();
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Required';
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
              textFieldName: 'Enquiry Time *',
              textFormField: TextFormField(
                controller: state.leadEnquiryTimeController,
                onTap: () {
                  state.getTime(context: context, filterFrom: "Lead");
                },
                readOnly: true,
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
                  hintText: "Enter Enquiry Time",
                  hintStyle: kHintText,
                  primaryColor: primaryColor,
                  borderColor: Colors.white,
                ),
              ),
            ),
          ),
        ]),
        TextFieldFormat(
          textFieldName: 'Remark *',
          textFormField: TextFormField(
            controller: state.leadRemarkController,
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
      ],
    );
  }
}
