import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../widgets/price_list_section_item_widget.dart';

class MyOrderHistoryProvider extends ChangeNotifier {
  MyOrderHistoryModel myOrderHistoryModelObj = MyOrderHistoryModel();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class MyOrderHistoryPage extends StatefulWidget {
  const MyOrderHistoryPage({super.key});

  @override
  MyOrderHistoryPageState createState() => MyOrderHistoryPageState();
  static Widget builder (BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyOrderHistoryProvider(),
      child: const MyOrderHistoryPage(),
    );
  }
}


class MyOrderHistoryPageState extends State<MyOrderHistoryPage>
    with AutomaticKeepAliveClientMixin<MyOrderHistoryPage> {
  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 2.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [_buildOrderList(context)],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildOrderList(BuildContext context) {
    return Expanded(
      child: Consumer<MyOrderHistoryProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 5.h),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0.h),
                child: Divider(
                  height: 1.h,
                  thickness: 0.5.h,
                  color: appTheme.gray100,
                ),
              );
            },
            itemCount: provider.myOrderHistoryModelObj.priceListSectionItemList
                .length,
            itemBuilder: (context, index) {
              PriceListSectionItemModel model =
              provider.myOrderHistoryModelObj.priceListSectionItemList[index];
              return PriceListSectionItemWidget(model,);
            },
          );
        },
      ),
    );
  }
}