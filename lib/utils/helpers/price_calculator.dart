class MegamartPriceCalculator {
  
  /// ✅ Calculates total price including tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return double.parse(totalPrice.toStringAsFixed(2));
  }

  /// ✅ Calculates shipping cost only
  static double calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return double.parse(shippingCost.toStringAsFixed(2));
  }

  /// ✅ Calculates tax amount based on location
  static double calculateTaxAmount(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return double.parse(taxAmount.toStringAsFixed(2));
  }

  /// ✅ Returns tax rate based on location
  static double getTaxRateForLocation(String location) {
    switch (location.toLowerCase()) {
      case 'pakistan':
        return 0.10; // 10%
      case 'usa':
        return 0.07; // 7%
      case 'uk':
        return 0.08; // 8%
      case 'uae':
        return 0.05; // 5%
      default:
        return 0.06; // Default 6%
    }
  }

  /// ✅ Returns shipping cost based on location
  static double getShippingCost(String location) {
    switch (location.toLowerCase()) {
      case 'pakistan':
        return 200.00;
      case 'usa':
        return 15.00;
      case 'uk':
        return 12.00;
      case 'uae':
        return 10.00;
      default:
        return 20.00; // Default flat rate
    }
  }
}
