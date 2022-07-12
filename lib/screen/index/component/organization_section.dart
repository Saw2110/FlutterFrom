import 'package:customstuff/widgets/dropdown/dropdown_classes.dart';
import 'package:customstuff/widgets/text_field_decoration.dart';
import 'package:customstuff/widgets/text_field_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketing/constant/colors.dart';
import 'package:marketing/constant/fonts.dart';
import 'package:marketing/model/dropdown_model.dart';
import 'package:marketing/state/index_state.dart';
import 'package:marketing/utils/email_validator.dart';
import 'package:marketing/utils/get_location.dart';
import 'package:marketing/widget/dropdown/dropdown_menu.dart';
import 'package:provider/provider.dart';

class OrganizationSection extends StatelessWidget {
  const OrganizationSection({Key? key}) : super(key: key);

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
              "Organization Information",
              style: kTitleText.copyWith(decoration: TextDecoration.underline),
            )),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Flexible(
            child: TextFieldFormat(
              textFieldName: 'Organization Name *',
              textFormField: TextFormField(
                controller: state.orgNameController,
                focusNode: state.organizationNameFocus,
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
                  hintText: "Organization Name",
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
              textFieldName: 'Organization Address *',
              textFormField: TextFormField(
                controller: state.orgAddressController,
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
                  hintText: "Address",
                  hintStyle: kHintText,
                  primaryColor: primaryColor,
                  borderColor: Colors.white,
                ),
              ),
            ),
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Flexible(
            child: TextFieldFormat(
              textFieldName: 'Organization Type *',
              textFormField: CustomDropDown<DropDownDataModel>(
                borderColor: Colors.white,
                primaryColor: primaryColor,
                fillColor: dropDownFillColor,
                items: state.organizationTypeList.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: DropDownMenuText(item: item.name),
                  );
                }).toList(),
                hint: 'Select Organization',
                onChanged: (DropDownDataModel? text) {
                  state.validateKey.currentState!.validate();
                  state.getOrgType = text!.id;
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
              textFieldName: 'District *',
              textFormField: CustomDropDown<DropDownDataModel>(
                borderColor: Colors.white,
                primaryColor: primaryColor,
                fillColor: dropDownFillColor,
                items: state.districtList.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: DropDownMenuText(item: item.name),
                  );
                }).toList(),
                hint: 'Select District',
                onChanged: (DropDownDataModel? text) {
                  state.validateKey.currentState!.validate();
                  state.getOrgDistrict = text!.id;
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
        TextFieldFormat(
          textFieldName: 'Contact Person *',
          textFormField: TextFormField(
            controller: state.orgContactPersonController,
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
              hintText: "Enter Contact Person",
              hintStyle: kHintText,
              primaryColor: primaryColor,
              borderColor: Colors.white,
            ),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Flexible(
            child: TextFieldFormat(
              textFieldName: 'Landline No.',
              textFormField: TextFormField(
                controller: state.orgLandlineController,
                maxLength: 10,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: TextFormDecoration.decoration(
                  hintText: "Enter Landline No.",
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
              textFieldName: 'Mobile No. *',
              textFormField: TextFormField(
                controller: state.orgMobileNoController,
                onChanged: (text) {
                  if (text.isNotEmpty) {
                    state.validateKey.currentState!.validate();
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Required *';
                  } else if (value.length != 10) {
                    return "Number must be 10 digit";
                  } else {
                    return null;
                  }
                },
                maxLength: 10,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: TextFormDecoration.decoration(
                  hintText: "Enter Mobile No.",
                  hintStyle: kHintText,
                  primaryColor: primaryColor,
                  borderColor: Colors.white,
                ),
              ),
            ),
          ),
        ]),

        ///
        const SelectTypeSection(),
        Row(children: [
          Checkbox(
              value: state.isViewMore,
              activeColor: primaryColor,
              onChanged: (value) {
                state.getViewMore = value!;
              }),
          Flexible(child: Text("View More", style: kTitleText))
        ]),
        if (state.isViewMore)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            child: Column(children: [
              TextFieldFormat(
                textFieldName: 'Email',
                textFormField: TextFormField(
                  controller: state.emailController,
                  onChanged: (text) {
                    if (text.isNotEmpty) {
                      state.validateKey.currentState!.validate();
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required *';
                    } else {
                      return validateEmail(value);
                    }
                  },
                  decoration: TextFormDecoration.decoration(
                    hintText: "Enter Email",
                    hintStyle: kHintText,
                    primaryColor: primaryColor,
                    borderColor: Colors.white,
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Flexible(
                  child: TextFieldFormat(
                    textFieldName: 'PAN',
                    textFormField: TextFormField(
                      controller: state.orgPanController,
                      onChanged: (text) {
                        if (text.isNotEmpty) {
                          state.validateKey.currentState!.validate();
                        }
                      },
                      decoration: TextFormDecoration.decoration(
                        hintText: "Enter PAN",
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
                    textFieldName: 'Social Media',
                    textFormField: TextFormField(
                      controller: state.socialMediaController,
                      onChanged: (text) {
                        if (text.isNotEmpty) {
                          state.validateKey.currentState!.validate();
                        }
                      },
                      decoration: TextFormDecoration.decoration(
                        hintText: "Facebook Username",
                        hintStyle: kHintText,
                        primaryColor: primaryColor,
                        borderColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Flexible(
                  child: TextFieldFormat(
                    textFieldName: 'Latitude',
                    textFormField: TextFormField(
                      controller: state.latitudeController,
                      readOnly: true,
                      onChanged: (text) {
                        if (text.isNotEmpty) {
                          state.validateKey.currentState!.validate();
                        }
                      },
                      decoration: TextFormDecoration.decoration(
                        hintText: "Enter Latitude",
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
                    textFieldName: 'Longitude',
                    textFormField: TextFormField(
                      controller: state.longitudeController,
                      readOnly: true,
                      onChanged: (text) {
                        if (text.isNotEmpty) {
                          state.validateKey.currentState!.validate();
                        }
                      },
                      decoration: TextFormDecoration.decoration(
                        hintText: "Enter Longitude",
                        hintStyle: kHintText,
                        primaryColor: primaryColor,
                        borderColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    var value = await GetLocation().getGeoLocationPosition();
                    state.latitudeController.text = "${value.latitude}";
                    state.longitudeController.text = "${value.longitude}";
                  },
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: primaryColor,
                  ),
                )
              ]),
            ]),
          ),
        // TextFieldFormat(
        //   textFieldName: 'Remark',
        //   textFormField: TextFormField(
        //     onChanged: (text) {
        //       if (text.isNotEmpty) {
        //         state.validateKey.currentState!.validate();
        //       }
        //     },
        //     validator: (value) {
        //       if (value!.isEmpty) {
        //         return 'Required *';
        //       } else {
        //         return null;
        //       }
        //     },
        //     maxLines: 3,
        //     decoration: TextFormDecoration.decoration(
        //       hintText: "Enter Remark",
        //       hintStyle: kHintText,
        //       primaryColor: primaryColor,
        //       borderColor: Colors.white,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

enum SoftwareType { offline, online, both }

class SelectTypeSection extends StatefulWidget {
  const SelectTypeSection({Key? key}) : super(key: key);

  @override
  State<SelectTypeSection> createState() => _SelectTypeSectionState();
}

class _SelectTypeSectionState extends State<SelectTypeSection> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<IndexState>();
    return Column(
      children: [
        ///
        TextFieldFormat(
          textFieldName: "Category",
          textFormField: Container(
            constraints:
                const BoxConstraints(minHeight: 50.0, maxHeight: 110.0),
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.texts.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 220.0,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(children: [
                      Row(children: [
                        Checkbox(
                            value: state.isChecked[index],
                            activeColor: primaryColor,
                            onChanged: (value) {
                              setState(() {
                                state.isChecked[index] = value!;
                                state.serviceTypeFocusList[index]
                                    .requestFocus();
                                if (state.isChecked[index] == false) {
                                  state.serviceTypeControllerList[index].text =
                                      "";
                                }
                              });
                            }),
                        Flexible(child: Text(state.texts[index]))
                      ]),
                      TextFormField(
                        controller: state.serviceTypeControllerList[index],
                        onChanged: (text) {
                          if (text.isNotEmpty) {
                            state.validateKey.currentState!.validate();
                          }
                        },
                        validator: (value) {
                          if (state.isChecked[index]) {
                            if (value!.isEmpty) {
                              return 'Required *';
                            } else {
                              return null;
                            }
                          } else {
                            return null;
                          }
                        },
                        readOnly: state.isChecked[index] ? false : true,
                        focusNode: state.serviceTypeFocusList[index],
                        decoration: TextFormDecoration.decoration(
                          hintText: "",
                          hintStyle: kHintText,
                          primaryColor: primaryColor,
                          borderColor: Colors.white,
                        ),
                      )
                    ]),
                  );
                }),
          ),
        ),

        ///
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextFieldFormat(
            textFieldName: "Type",
            textFormField: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Row(children: [
                      Radio<SoftwareType>(
                        value: SoftwareType.offline,
                        groupValue: state.typeValue,
                        activeColor: primaryColor,
                        onChanged: (value) {
                          setState(() {
                            state.typeValue = value;
                            state.getSoftwareType = "0";
                          });
                        },
                      ),
                      const Expanded(child: Text('Offline'))
                    ]),
                  ),
                  Expanded(
                    child: Row(children: [
                      Radio<SoftwareType>(
                        value: SoftwareType.online,
                        groupValue: state.typeValue,
                        activeColor: primaryColor,
                        onChanged: (value) {
                          setState(() {
                            state.typeValue = value;
                            state.getSoftwareType = "1";
                          });
                        },
                      ),
                      const Expanded(child: Text('Online'))
                    ]),
                  ),
                  Expanded(
                    child: Row(children: [
                      Radio<SoftwareType>(
                        value: SoftwareType.both,
                        groupValue: state.typeValue,
                        activeColor: primaryColor,
                        onChanged: (value) {
                          setState(() {
                            state.typeValue = value;
                            state.getSoftwareType = "2";
                          });
                        },
                      ),
                      const Expanded(child: Text('Both'))
                    ]),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
