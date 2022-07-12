import 'package:customstuff/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketing/service/routehelper/route_name.dart';
import 'package:marketing/state/index_state.dart';
import 'package:marketing/utils/alert/log_out.dart';
import 'package:provider/provider.dart';

import 'component/followup_section.dart';
import 'component/lead_section.dart';
import 'component/organization_section.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<IndexState>(context, listen: false).getContext = context;
    Provider.of<IndexState>(context, listen: false).init();
  }

  onBack() async {
    SystemNavigator.pop(animated: true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onBack();
      },
      child: Consumer<IndexState>(builder: (context, state, child) {
        return Stack(children: [
          Scaffold(
            ///
            appBar: AppBar(
              title: const Text("Home"),
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, orgListPath);
                    },
                    icon: const Icon(Icons.sort),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    LogOut.logOut(context: context);
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),

            ///
            bottomNavigationBar: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  state.onSubmit();
                },
                child: const Text("SUBMIT"),
              ),
            ),

            ///
            body: Form(
              key: state.validateKey,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: const [
                          OrganizationSection(),
                          CustomDottedDivider(),
                          SizedBox(height: 5.0),
                          LeadSection(),
                          CustomDottedDivider(),
                          SizedBox(height: 5.0),
                          FollowUpSection(),
                        ]),
                      );
                    }, childCount: 1),
                  ),
                ],
              ),
            ),
          ),
        ]);
      }),
    );
  }
}
