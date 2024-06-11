import 'package:flutter/material.dart';
import 'package:full_retrofit/util.dart';

import 'bank_card.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key,required  this.card, required this.onLongPress});
  final VoidCallback onLongPress;
  final BankCard card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          height: 220,
          decoration: BoxDecoration(
            color: getRandomColor(),
            borderRadius: BorderRadius.circular(12)
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(card.bankName ?? "",style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20
                  )),
                  Align(
                    alignment: Alignment.center,
                    child: Text((card.number ?? 0).toString(), style: const TextStyle(
                      fontSize: 22
                    )),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Card Holder"),
                      Text("Expire Date"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(card.holderName ?? ""),
                      Text(card.expireDate ?? ""),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
