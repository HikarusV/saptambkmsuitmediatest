import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmediatest/common/state_enum.dart';
import 'package:suitmediatest/presentation/provider/third_provider.dart';
import 'package:suitmediatest/presentation/widgets/custom_scaffold.dart';
import 'package:suitmediatest/presentation/widgets/user_card.dart';

import '../widgets/scroll_behavior_without_glow.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<ThirdProvider>(context, listen: false)..fetchDataUser(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Third Screen",
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<ThirdProvider>().fetchDataUser();
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!context.read<ThirdProvider>().isLoading &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              context.read<ThirdProvider>().fetchDataUserAfter();
              return true;
            }
            return false;
          },
          child: ScrollConfiguration(
            behavior: ScrollBehaviorWithoutGlow(),
            child: Consumer<ThirdProvider>(
              builder: (context, value, _) {
                if (value.stateUsers == ResultState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (value.stateUsers == ResultState.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 21, vertical: 15),
                          itemCount: value.data.length,
                          itemBuilder: (context, i) => UserCard(
                            user: value.data[i],
                          ),
                        ),
                        context.watch<ThirdProvider>().loadingWidget
                      ],
                    ),
                  );
                } else if (value.stateUsers == ResultState.noData) {
                  return const Center(
                    child: Text("Empty Data"),
                  );
                } else {
                  return Center(
                    child: Text(value.message),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
