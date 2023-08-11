import 'package:my_portifolio/utils/device_type.dart';

extension DeviceTypeExtension on DeviceType {
  int getMinWidth() {
    switch(this) {
      case DeviceType.mobile:
        return 320;
      case DeviceType.ipad:
        return 481;
      case DeviceType.smallScreen:
        return 769;
      case DeviceType.largeScreen:
        return 1025;
      case DeviceType.extraLargeTv:
        return 1201;
    }
  }

  int getMaxWidth() {
    switch (this) {
      case DeviceType.mobile:
        return 580;
      case DeviceType.ipad:
        return 868;
      case DeviceType.smallScreen:
        return 1024;
      case DeviceType.largeScreen:
        return 1200;
      case DeviceType.extraLargeTv:
        return 3840; // any number more than 1200
    }
  }
}