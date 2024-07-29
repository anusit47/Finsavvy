import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class InvestmentCard extends StatelessWidget {
  const InvestmentCard({
    super.key,
    required this.image,
    required this.name,
    required this.type,
    required this.currentPrice,
    this.priceAfterDiscount,
    this.percentChange,
    required this.press,
  });

  final String image, name, type;
  final double currentPrice;
  final double? priceAfterDiscount;
  final double? percentChange;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = NumberFormat('#,##0.00');

    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(140, 220),
        maximumSize: const Size(140, 220),
        padding: const EdgeInsets.all(8),
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.15,
            child: Stack(
              children: [
                SizedBox(
                  width: 140, // Adjust width as needed
                  height: 140, // Adjust height as needed
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(100), // Adjust radius as needed
                    child: SvgPicture.network(
                      image,
                      placeholderBuilder: (BuildContext context) => Container(
                        padding: const EdgeInsets.all(30.0),
                        child: const CircularProgressIndicator(),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (percentChange != null)
                  Positioned(
                    right: defaultPadding / 2,
                    top: defaultPadding / 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding / 2),
                      height: 16,
                      decoration: BoxDecoration(
                        color: percentChange! > 0 ? Colors.green : Colors.red,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(defaultBorderRadious)),
                      ),
                      child: Center(
                        child: Text(
                          "${percentChange! > 0 ? '+' : ''}$percentChange% ${percentChange! > 0 ? 'up' : 'down'}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      type.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 10),
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Center(
                    child: Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: priceAfterDiscount != null
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "\$${formatter.format(priceAfterDiscount)}",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 68, 255, 0),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: defaultPadding / 4),
                              Text(
                                "\$${formatter.format(currentPrice)}",
                                style: TextStyle(
                                  color: percentChange! > 0
                                      ? Colors.green
                                      : Colors.red,
                                  fontSize: 10,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            "\$${formatter.format(currentPrice)}",
                            style: TextStyle(
                              color: percentChange! > 0
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
