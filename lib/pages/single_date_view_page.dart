import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/components/vp_nest_listview.dart';
import 'package:fyp_our_sky_new/models/date_detail.dart';
import 'package:fyp_our_sky_new/models/date_detail_structured.dart';
import 'package:fyp_our_sky_new/providers/date_detail_provider.dart';
import 'package:fyp_our_sky_new/utils/app_settings.dart';

class SingleDateViewPage extends ConsumerStatefulWidget {
  SingleDateViewPage({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  ConsumerState<SingleDateViewPage> createState() => _SingleDateViewPageState();
}

class _SingleDateViewPageState extends ConsumerState<SingleDateViewPage> {
  late DateTime startDate;
  late DateTime endDate;
  late int pageIndex;

  late PageController _controller;

  void initPageIndex() {
    pageIndex = widget.date.difference(startDate).inDays.abs();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startDate = AppSettings.calendarStartDate;
    endDate = AppSettings.calendarEndDate;
    initPageIndex();
    _controller = PageController(initialPage: pageIndex);
  }

  Widget _buildSingleDatePageView(double height, double width) {
    final numOfTotalDays = startDate.difference(endDate).inDays.abs();

    return Positioned(
      bottom: 0,
      child: Container(
        height: height,
        width: width,
        child: VPNestListView(),
        // child: PageView.builder(
        //   scrollDirection: Axis.vertical,
        //   controller: _controller,
        //   itemCount: numOfTotalDays,
        //   allowImplicitScrolling: true,
        //   itemBuilder: (context, index) {
        //     final date = DateTime(startDate.year, startDate.month, startDate.day + index);
        //     final dateString = "${date.year}-${date.month}-${date.day}";
        //     return SingleDatePageViewContent(
        //       date: date,
        //       dateString: dateString,
        //       height: height,
        //       width: width,
        //     );
        //   },
        // ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(dateString);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/images/background/background-sky.jpg",
                fit: BoxFit.fitHeight,
                alignment: Alignment(1, 1),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  _buildSingleDatePageView(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SingleDatePageViewContent extends ConsumerWidget {
  const SingleDatePageViewContent({
    super.key,
    required this.date,
    required this.dateString,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  final DateTime date;
  final String dateString;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateDetailStructured = ref.watch(dateDetailStructuredWatcherProvider(dateString: dateString));
    return dateDetailStructured.when(
      data: (data) {
        return SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            child: Container(
              height: 100,
              child: SingleChildScrollView(
                child: Container(
                  height: 100,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Container();
      },
      loading: () {
        return Container();
      },
    );
  }
}
