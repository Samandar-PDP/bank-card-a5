import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_retrofit/bank_card.dart';
import 'package:full_retrofit/card_page.dart';
import 'package:full_retrofit/repository.dart';
import 'package:full_retrofit/util.dart';
import 'package:gap/gap.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {

  final _bankName = TextEditingController();
  final _holderName = TextEditingController();
  final _cardNumber = TextEditingController();
  final _expDate1 = TextEditingController();
  final _expDate2 = TextEditingController();
  final _cvv = TextEditingController();

  late Color _color;

  final _repo = Repository();

  @override
  void initState() {
    _color = getRandomColor();
    super.initState();
  }

  void _create() {
    final card = BankCard(
      id: null,
      holderName: _holderName.text,
      bankName: _bankName.text,
      number: int.parse(_cardNumber.text),
      expireDate: _holderName.text,
      cvv: int.parse(_cvv.text),
    );
    _repo.createCard(card).then((value) {
      if(value) {
        Navigator.of(context)
            .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const CardPage()), (route) => false);
      } else {
        showError(context, "Error");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Card"),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(CupertinoIcons.clear),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          children: [
            _card(),
            const Gap(20),
            const Text("Bank name"),
            const Gap(10),
            CupertinoTextField(
              padding: const EdgeInsets.all(16),
              onChanged: (v) => setState(() {}),
              controller: _bankName,
              style: const TextStyle(
                  color: Colors.white
              ),
              maxLength: 16,
            ),
            const Gap(10),
            const Text("Holder name"),
            const Gap(10),
            CupertinoTextField(
              padding: const EdgeInsets.all(16),
              onChanged: (v) => setState(() {}),
              controller: _holderName,
              style: const TextStyle(
                  color: Colors.white
              ),
            ),
            const Gap(10),
            const Text("Card Number"),
            const Gap(10),
            CupertinoTextField(
              padding: const EdgeInsets.all(16),
              onChanged: (v) => setState(() {}),
              controller: _cardNumber,
              style: const TextStyle(
                color: Colors.white
              ),
              maxLength: 19,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Expired date"),
                Padding(
                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 4.1),
                  child: Text("CVV"),
                ),
              ],
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: CupertinoTextField(
                  padding: const EdgeInsets.all(16),
                  onChanged: (v) => setState(() {}),
                  controller: _expDate1,
                  style: const TextStyle(
                      color: Colors.white
                  ),
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                )),
                const Gap(5),
                Expanded(child: CupertinoTextField(
                  padding: const EdgeInsets.all(16),
                  onChanged: (v) => setState(() {}),
                  controller: _expDate2,
                  style: const TextStyle(
                      color: Colors.white
                  ),
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                )),
                const Gap(5),
                Expanded(child: CupertinoTextField(
                  padding: const EdgeInsets.all(16),
                  onChanged: (v) => setState(() {}),
                  controller: _cvv,
                  style: const TextStyle(
                      color: Colors.white
                  ),
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: _create,
            child: const Text("Create"),
            style: ElevatedButton.styleFrom(
              backgroundColor: _color
            ),
          ),
        ),
      ),
    );
  }

  _card() {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        height: 220,
        decoration: BoxDecoration(
            color: _color, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(_bankName.text,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 20)),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(_cardNumber.text,
                      style: const TextStyle(fontSize: 22)),
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
                    Text(_holderName.text),
                    Text(_expDate1.text + _expDate2.text),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
