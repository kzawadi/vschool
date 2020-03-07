enum FeesType { CIRCULAR, ACTIVITY, UNKNOWN }

class FeesTypeHelper {
  static String getValue(FeesType type) {
    switch (type) {
      case FeesType.ACTIVITY:
        return "ACTIVITY";
      case FeesType.CIRCULAR:
        return "CIRCULAR";
      default:
        return 'UNKNOWN';
    }
  }

  static FeesType getEnum(String type) {
    switch (type) {
      case "ACTIVITY":
        return FeesType.ACTIVITY;
      case "CIRCULAR":
        return FeesType.CIRCULAR;
      default:
        return FeesType.UNKNOWN;
    }
  }
}
