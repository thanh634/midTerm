// APP NAVIGATION
import 'package:midterm/core/app_export.dart';

class AppNavigationModel {}

// SPLASH SCREEN
class SplashModel {}

// DETAILS SCREEN
class DetailsModel {}

// HOME SCREEN
class HomeModel {
  LoyaltyCardItemModel loyaltyCardItemModel =
    LoyaltyCardItemModel(nameCard: "loyalty card", milestones: "4 / 8");

  List<CoffeeSelectionGridItemModel> coffeeSelectionGridItemList = [
    CoffeeSelectionGridItemModel(coffeeImg: ImageConstant.Americano, coffeeName: "Americano"),
    CoffeeSelectionGridItemModel(coffeeImg: ImageConstant.Cappuccino, coffeeName: "Cappuccino"),
    CoffeeSelectionGridItemModel(coffeeImg: ImageConstant.Mocha, coffeeName: "Mocha"),
    CoffeeSelectionGridItemModel(coffeeImg: ImageConstant.FlatWhite, coffeeName: "Flat White"),
  ];
}

class CoffeeSelectionGridItemModel {
  CoffeeSelectionGridItemModel({this.coffeeImg, this.coffeeName, this.id}) {
    coffeeImg = coffeeImg ?? ImageConstant.Americano;
    coffeeName = coffeeName ?? "Americano";
    id = id ?? "";
  }

  String? coffeeImg;

  String? coffeeName;

  String? id;
}

// REWARD SCREEN

class LoyaltyCardItemModel  {
  LoyaltyCardItemModel({this.nameCard, this.milestones, this.id}) {
    nameCard = nameCard ?? "Loyalty card";
    milestones = milestones ?? "4 / 8";
    id = id ?? "";
  }

  String? nameCard;

  String? milestones;

  String? id;

}

class RedeemCardItemModel {
  RedeemCardItemModel({this.nameCard, this.totalPoints, this.id}) {
    nameCard = nameCard ?? "My Points :";
    totalPoints = totalPoints ?? "2750";
    id = id ?? "";
  }

  String? nameCard;

  String? totalPoints;

  String? id;

}

class RewardsHistorySectionItemModel {
  RewardsHistorySectionItemModel({this.coffeeName, this.buyDate, this.points, this.id}) {
    coffeeName = coffeeName ?? "Americano";
    buyDate = buyDate ?? "24 June | 12:30 PM";
    points = points ?? "+ 12 Pts";
    id = id ?? "";
  }

  String? coffeeName;
  String? buyDate;
  String? points;
  String? id;
}

class RewardsModel {
  LoyaltyCardItemModel loyaltyCardItemModel =
    LoyaltyCardItemModel(nameCard: "loyalty card", milestones: "4 / 8");
  RedeemCardItemModel redeemCardItemModel =  RedeemCardItemModel();

  List<RewardsHistorySectionItemModel> rewardsHistorySectionItemList = [
    RewardsHistorySectionItemModel(coffeeName: "Americano",buyDate:  "24 June | 12:30 PM",points:  "+ 12 Pts"),
    RewardsHistorySectionItemModel(coffeeName: "Cafe Latte",buyDate:  "22 June | 08:30 AM",points:  "+ 12 Pts"),
    RewardsHistorySectionItemModel(coffeeName: "Green Tea Latte",buyDate:  "16 June | 10:48 AM",points:  "+ 12 Pts"),
    RewardsHistorySectionItemModel(coffeeName: "Flat White",buyDate:  "12 May | 11:25 AM",points:  "+ 12 Pts"),
  ];
}

// PROFILE SCREEN

class ProfileModel {}

// CURRENT ORDER
// ORDER HISTORY
class MyCurrentOrderModel {}

class MyCurrentTabModel {
  List<PriceListSectionItemModel> priceListSectionItemList = [
    PriceListSectionItemModel(
        buyDate: "24 June | 12:30 PM",
        price: "\$3.00",
        coffeeName: "Americano",
        address: "3 Addersion Court Chino Hills, HO56824, United State"),
    PriceListSectionItemModel(
        buyDate: "24 June | 12:30 PM",
        price: "\$3.00",
        coffeeName: "Cafe Latte",
        address: "3 Addersion Court Chino Hills, HO56824, United State"),
    PriceListSectionItemModel(
        buyDate: "24 June | 12:30 PM",
        price: "\$3.00",
        coffeeName: "Flat White",
        address: "3 Addersion Court Chino Hills, H056824, United State")
  ];
}

class MyOrderHistoryModel {
  List<PriceListSectionItemModel> priceListSectionItemList = [
    PriceListSectionItemModel(
        buyDate: "24 June | 12:30 PM",
        price: "\$3.00",
        coffeeName: "Americano",
        address: "3 Addersion Court Chino Hills, HO56824, United State"),
    PriceListSectionItemModel(
        buyDate: "24 June | 12:30 PM",
        price: "\$3.00",
        coffeeName: "Cafe Latte",
        address: "3 Addersion Court Chino Hills, HO56824, United State"),
  ];
}

class PriceListSectionItemModel {
  PriceListSectionItemModel({this.buyDate, this.price, this.coffeeName, this.address, this.id}) {
    buyDate = buyDate ?? "24 June | 12:30 PM";
    price = price ?? "\$3.00";
    coffeeName = coffeeName ?? "Americano";
    address = address ?? "3 Addersion Court Chino Hills, HO56824, United State";
    id = id ?? "";
  }
  String? buyDate;
  String? price;
  String? coffeeName;
  String? address;
  String? id;
}

// CART SCREEN
class CoffeeListItemModel {
  CoffeeListItemModel(
      {this.coffeeImg,
        this.coffeeName,
        this.coffeeOpt,
        this.num,
        this.price,
        this.id
      })
  {
    coffeeImg = coffeeImg ?? ImageConstant.Americano;
    coffeeName = coffeeName ?? "Americano";
    coffeeOpt = coffeeOpt ?? "single | iced | medium | full ice"; num = num ?? "x 1";
    price = price ?? "\$3.00";
    id = id ?? "";
  }
  String? coffeeImg;
  String? coffeeName;
  String? coffeeOpt;
  String? num;
  String? price;
  String? id;
}

class MyCartModel {
  List<CoffeeListItemModel> coffeeListItemList = [
    CoffeeListItemModel(
        coffeeImg: ImageConstant.Americano,
        coffeeName: "Americano",
        coffeeOpt: "single | iced | medium | full ice",
        num: "x 1",
        price: "\$3.00"
    ),
    CoffeeListItemModel(
        coffeeImg: ImageConstant.Cappuccino,
        coffeeName: "Cappuccino",
        coffeeOpt: "single | iced | medium | full ice",
        num: "x 1",
        price: "\$3.00"
    ),
    CoffeeListItemModel(
        coffeeImg: ImageConstant.FlatWhite,
        coffeeName: "Flat White",
        coffeeOpt: "single | iced | medium | full ice",
        num: "x 1",
        price: "\$3.00"
    ),
  ];
}




// ORDER SUCCESS
class OrderSuccessModel {}

// REDEEM REWARD SCREEN
class RedeemRewardsListItemModel {
  RedeemRewardsListItemModel({this.coffeeName, this.validUntil, this.id}) {
    coffeeName = coffeeName ?? "Cafe Latte";
    validUntil = validUntil ?? "Valid until 04.07.21";
    id = id ?? "";
  }
  String? coffeeName;
  String? validUntil;
  String? id;
}

class RedeemRewardsModel {
  List<RedeemRewardsListItemModel> redeemRewardsListItemList = [
    RedeemRewardsListItemModel(
        coffeeName: "Cafe Latte", validUntil: "Valid until 04.07.21"
    ),
    RedeemRewardsListItemModel(
        coffeeName: "Flat White", validUntil: "Valid until 04.07.21"
    ),
    RedeemRewardsListItemModel(
        coffeeName: "Cappuccino", validUntil: "Valid until 04.07.21"
    )
  ];
}




