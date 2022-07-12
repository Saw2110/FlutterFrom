import 'package:customstuff/widgets/text_field_format.dart';
import 'package:flutter/material.dart';
import 'package:marketing/constant/fonts.dart';
import 'package:marketing/screen/orglist/component/org_section.dart';
import 'package:marketing/state/orglist_state.dart';
import 'package:marketing/utils/alert/confirmation_alert.dart';
import 'package:marketing/widget/loading_indicator.dart';
import 'package:provider/provider.dart';

class OrgDetailScreen extends StatefulWidget {
  final String organizationName;

  const OrgDetailScreen({Key? key, required this.organizationName})
      : super(key: key);

  @override
  State<OrgDetailScreen> createState() => _OrgDetailScreenState();
}

class _OrgDetailScreenState extends State<OrgDetailScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<OrgListState>(context, listen: false)
        .getDropDownDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<OrgListState>();
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: Text(widget.organizationName)),

          ///
          bottomNavigationBar: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: ElevatedButton(
              onPressed: () {
                ConfirmationAlert.confirmation(
                    text: "you want to send data ?",
                    context: context,
                    onCancel: () {
                      Navigator.pop(context);
                    },
                    onConfirm: () {
                      state.onDataUpload(from: "");
                    });
              },
              child: const Text("UPLOAD"),
            ),
          ),

          body: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Organization Information",
                      style: kTitleText.copyWith(
                          decoration: TextDecoration.underline),
                    )),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  if (state.dataValue.orgName.isNotEmpty)
                    Flexible(
                      child: TextFieldFormat(
                        textFieldName: 'Organization Name *',
                        textFormField:
                            OrgDetailWidget(value: state.dataValue.orgName),
                      ),
                    ),
                  const SizedBox(width: 5.0),
                  if (state.dataValue.orgAddress.isNotEmpty)
                    Flexible(
                      child: TextFieldFormat(
                        textFieldName: 'Organization Address *',
                        textFormField:
                            OrgDetailWidget(value: state.dataValue.orgAddress),
                      ),
                    ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  if (state.dataValue.orgType.isNotEmpty)
                    Flexible(
                      child: TextFieldFormat(
                        textFieldName: 'Organization Type *',
                        textFormField: OrgDetailWidget(
                          value: state.organizationTypeName,
                        ),
                      ),
                    ),
                  const SizedBox(width: 5.0),
                  if (state.dataValue.orgDistrict.isNotEmpty)
                    Flexible(
                      child: TextFieldFormat(
                        textFieldName: 'District *',
                        textFormField:
                            OrgDetailWidget(value: state.districtName),
                      ),
                    ),
                ]),
                if (state.dataValue.orgContactPerson.isNotEmpty)
                  TextFieldFormat(
                    textFieldName: 'Contact Person *',
                    textFormField: OrgDetailWidget(
                        value: state.dataValue.orgContactPerson),
                  ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  if (state.dataValue.orgLandlineNo.isNotEmpty)
                    Flexible(
                      child: TextFieldFormat(
                        textFieldName: 'Landline No.',
                        textFormField: OrgDetailWidget(
                            value: state.dataValue.orgLandlineNo),
                      ),
                    ),
                  const SizedBox(width: 5.0),
                  if (state.dataValue.mobileNo.isNotEmpty)
                    Flexible(
                      child: TextFieldFormat(
                        textFieldName: 'Mobile No. *',
                        textFormField:
                            OrgDetailWidget(value: state.dataValue.mobileNo),
                      ),
                    ),
                ]),

                ///
                // const SelectTypeSection(),
                ///
                if (state.dataValue.email.isNotEmpty)
                  TextFieldFormat(
                    textFieldName: 'Email',
                    textFormField:
                        OrgDetailWidget(value: state.dataValue.email),
                  ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  if (state.dataValue.orgPAN.isNotEmpty)
                    Flexible(
                      child: TextFieldFormat(
                        textFieldName: 'PAN',
                        textFormField:
                            OrgDetailWidget(value: state.dataValue.orgPAN),
                      ),
                    ),
                  const SizedBox(width: 5.0),
                  if (state.dataValue.socialMedia.isNotEmpty)
                    Flexible(
                      child: TextFieldFormat(
                        textFieldName: 'Social Media',
                        textFormField:
                            OrgDetailWidget(value: state.dataValue.socialMedia),
                      ),
                    ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  if (state.dataValue.latitude.isNotEmpty)
                    Flexible(
                      child: TextFieldFormat(
                        textFieldName: 'Latitude',
                        textFormField:
                            OrgDetailWidget(value: state.dataValue.latitude),
                      ),
                    ),
                  const SizedBox(width: 5.0),
                  if (state.dataValue.longitude.isNotEmpty)
                    Flexible(
                      child: TextFieldFormat(
                        textFieldName: 'Longitude',
                        textFormField:
                            OrgDetailWidget(value: state.dataValue.longitude),
                      ),
                    ),
                ]),

                const SizedBox(height: 10.0),

                /// ========================== Lead Section ==================================== ///
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Leads Information",
                    style: kTitleText.copyWith(
                        decoration: TextDecoration.underline),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  if (state.dataValue.leadSource.isNotEmpty)
                    Flexible(
                      child: TextFieldFormat(
                        textFieldName: 'Select Source *',
                        textFormField:
                            OrgDetailWidget(value: state.leadSourceName),
                      ),
                    ),
                  const SizedBox(width: 5.0),
                  if (state.dataValue.leadProduct.isNotEmpty)
                    Flexible(
                      child: TextFieldFormat(
                        textFieldName: 'Select Product *',
                        textFormField:
                            OrgDetailWidget(value: state.leadProductName),
                      ),
                    ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  if (state.dataValue.leadStatus.isNotEmpty)
                    Flexible(
                      child: TextFieldFormat(
                        textFieldName: 'Select Lead Status *',
                        textFormField: OrgDetailWidget(
                            value: state.getLeadStatusName(
                          value: state.dataValue.leadStatus,
                        )),
                      ),
                    ),
                  const SizedBox(width: 5.0),
                  if (state.dataValue.leadStaff.isNotEmpty)
                    Flexible(
                      child: TextFieldFormat(
                        textFieldName: 'Select Staff *',
                        textFormField: OrgDetailWidget(
                          value: state.leadStaffName,
                        ),
                      ),
                    ),
                ]),
                Row(children: [
                  if (state.dataValue.leadDate.isNotEmpty)
                    Flexible(
                      child: TextFieldFormat(
                        textFieldName: "Select Date *",
                        textFormField:
                            OrgDetailWidget(value: state.dataValue.leadDate),
                      ),
                    ),
                  const SizedBox(width: 10.0),
                  if (state.dataValue.enquiryTime.isNotEmpty)
                    Flexible(
                      child: TextFieldFormat(
                        textFieldName: 'Enquiry Time *',
                        textFormField:
                            OrgDetailWidget(value: state.dataValue.enquiryTime),
                      ),
                    ),
                ]),
                if (state.dataValue.leadRemark.isNotEmpty)
                  TextFieldFormat(
                    textFieldName: 'Remark *',
                    textFormField:
                        OrgDetailWidget(value: state.dataValue.leadRemark),
                  ),

                const SizedBox(height: 10.0),

                /// ========================== Follow Up Section ==================================== ///
                if (state.dataValue.flag == "LF")
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "Follow Up Information",
                            style: kTitleText.copyWith(
                                decoration: TextDecoration.underline),
                          )),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: TextFieldFormat(
                                textFieldName: 'Quote Price *',
                                textFormField: OrgDetailWidget(
                                    value: state.dataValue.quotePrice),
                              ),
                            ),
                            const SizedBox(width: 5.0),
                            Flexible(
                              child: TextFieldFormat(
                                textFieldName: 'Select Follow *',
                                textFormField:
                                    OrgDetailWidget(value: state.followForName),
                              ),
                            ),
                          ]),
                      Row(children: [
                        Flexible(
                          child: TextFieldFormat(
                            textFieldName: "Select Date *",
                            textFormField: OrgDetailWidget(
                                value: state.dataValue.followDate),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Flexible(
                          child: TextFieldFormat(
                            textFieldName: 'Follow Time *',
                            textFormField: OrgDetailWidget(
                                value: state.dataValue.followTime),
                          ),
                        ),
                      ]),
                      TextFieldFormat(
                        textFieldName: 'Select Staff *',
                        textFormField:
                            OrgDetailWidget(value: state.followStaffName),
                      ),
                      TextFieldFormat(
                        textFieldName: 'Remark',
                        textFormField: OrgDetailWidget(
                            value: state.dataValue.followRemark),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
        if (state.isLoading) LoadingScreen.loadingScreen(),
      ],
    );
  }
}
