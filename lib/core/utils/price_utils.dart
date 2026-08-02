class PriceUtils {
  const PriceUtils._();

  static double getOriginalPrice({
    required double price,
    required int discount,
  }) {
    if (discount <= 0) {
      return price;
    }

    return price / (1 - (discount / 100));
  }
}