import 'package:customstuff/widgets/custom_decoration.dart';
import 'package:flutter/material.dart';
import 'package:marketing/constant/colors.dart';
import 'package:marketing/service/routehelper/route_name.dart';
import 'package:marketing/state/orglist_state.dart';
import 'package:marketing/utils/alert/confirmation_alert.dart';
import 'package:marketing/widget/loading_indicator.dart';
import 'package:marketing/widget/no_data_widget.dart';
import 'package:provider/provider.dart';

class OrgListScreen extends StatefulWidget {
  const OrgListScreen({Key? key}) : super(key: key);

  @override
  State<OrgListScreen> createState() => _OrgListScreenState();
}

class _OrgListScreenState extends State<OrgListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<OrgListState>(context, listen: false).getContext = context;
    Provider.of<OrgListState>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrgListState>(builder: (context, state, child) {
      return Stack(children: [
        Scaffold(
          appBar: AppBar(title: const Text("Organization List"), actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: IconButton(
                onPressed: () {
                  ConfirmationAlert.confirmation(
                      text: "you want to delete all data ?",
                      context: context,
                      onCancel: () {
                        Navigator.pop(context);
                      },
                      onConfirm: () async {
                        state.deleteAll();
                      });
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ),
          ]),
          body: state.dataList.isNotEmpty
              ? ListView.builder(
              itemCount: state.dataList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      ConfirmationAlert.confirmation(
                          text: "you want to delete data ?",
                          context: context,
                          onCancel: () {
                            state.getDataFromDB();
                          },
                          onConfirm: () {
                            state.deleteById(
                              idValue: state.dataList[index].primaryId!,
                            );
                          });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 2.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: ContainerDecoration.decoration(),
                      child: InkWell(
                        onTap: () {
                          state.dataValue = state.filterList(
                            orgName: state.dataList[index].orgName,
                          );

                              Navigator.pushNamed(
                            context,
                            orgDetailPath,
                            arguments: state.dataList[index].orgName,
                          );
                        },
                        child: Row(children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text:
                                          state.dataList[index].orgName,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                              TextDecoration.underline),
                                          children: [
                                            TextSpan(
                                                text:
                                                ' -(${state.dataList[index].orgAddress})',
                                                style: const TextStyle(
                                                  fontSize: 13.0,
                                                  color: Colors.black,
                                                  decoration:
                                                  TextDecoration.none,
                                                ))
                                          ])),
                                  const SizedBox(height: 2.0),

                                  ///
                                  (state.dataList[index].orgLandlineNo
                                      .isNotEmpty &&
                                      state.dataList[index].mobileNo
                                          .isNotEmpty)
                                      ? Text("Ph. " +
                                      state.dataList[index]
                                          .orgLandlineNo +
                                      ", " +
                                      state.dataList[index].mobileNo)
                                      : Text("Ph. " +
                                      state.dataList[index]
                                          .orgLandlineNo +
                                      state.dataList[index].mobileNo),

                                  ///
                                  const SizedBox(height: 5.0),
                                  Text(
                                      state
                                          .dataList[index].orgContactPerson,
                                      style: const TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ]),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                ConfirmationAlert.confirmation(
                                    text: "you want to send data ?",
                                    context: context,
                                    onCancel: () {
                                      Navigator.pop(context);
                                    },
                                    onConfirm: () {
                                          state.dataValue = state.filterList(
                                            orgName:
                                                state.dataList[index].orgName,
                                          );
                                          state.onDataUpload(from: 'List');
                                        });
                              },
                              child: const Text(
                                "UPLOAD",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ]),
                      ),
                    ));
              })
              : const NoDataWidget(),
        ),
        if (state.isLoading) LoadingScreen.loadingScreen()
      ]);
    });
  }
}
