import 'package:easy_localization/easy_localization.dart';

enum PaymentMethod {
  momoWallet,
  vnpayWallet,
  iCard,
}

extension PaymentMethodExtension on PaymentMethod {
  int get type {
    switch (this) {
      case PaymentMethod.momoWallet:
        return 1;
      case PaymentMethod.vnpayWallet:
        return 2;
      default:
        return 3;
    }
  }

  String get name {
    switch (this) {
      case PaymentMethod.momoWallet:
        return 'msg_momo_wallet'.tr();
      case PaymentMethod.vnpayWallet:
        return 'msg_VNpay_wallet'.tr();
      case PaymentMethod.iCard:
        return 'msg_icard'.tr();
      default:
        return '';
    }
  }
}
