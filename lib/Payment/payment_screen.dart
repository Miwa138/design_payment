import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_design/Payment/conf.dart';

import 'utils/custom_input_formatter_number_card.dart';
import 'utils/custom_input_formatter_number_expiries.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mC,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                NMButton(
                  down: false,
                  icon: Icons.arrow_back,
                ),
                NMButton(
                  down: false,
                  icon: Icons.search,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 10,
            ),
            CreditCard(),
            SizedBox(
              height: MediaQuery.of(context).size.width / 10,
            ),
            const NMCard(
              active: false,
              icon: Icons.wifi,
              label: 'NFC Payment',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 10,
            ),
            const BKCard(
              active: true,
              icon: Icons.lock_outline,
              label: 'Заблокировать',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 10,
            ),
            TransactionSlider(),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width / 50,
                ),
                Container(
                  width: 70,
                  child: const NMButton(
                    down: false,
                    icon: Icons.credit_card,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                Container(
                  width: 70,
                  child: const NMButton(
                    down: false,
                    icon: Icons.trending_up,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                Container(
                  width: 70,
                  child: const NMButton(
                    down: false,
                    icon: Icons.notifications_none,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NMButton extends StatelessWidget {
  final bool down;
  final IconData icon;

  const NMButton({required this.down, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: down ? nMboxInvert : nMbox,
      child: Icon(
        icon,
        color: down ? fCD : fCL,
      ),
    );
  }
}

class NMCard extends StatelessWidget {
  final bool active;
  final IconData icon;
  final String label;

  const NMCard({required this.active, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: nMbox,
      child: Row(
        children: <Widget>[
          SizedBox(width: MediaQuery.of(context).size.width / 40),
          Icon(icon, color: fCL),
          const SizedBox(width: 15),
          SizedBox(width: MediaQuery.of(context).size.width / 20),
          Container(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                color: fCD,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 20),
          Container(
            decoration: active ? nMboxInvertActive : nMboxInvert,
            width: 70,
            height: 70,
            child: Container(
              margin: active
                  ? const EdgeInsets.fromLTRB(35, 5, 5, 5)
                  : const EdgeInsets.fromLTRB(5, 5, 35, 5),
              decoration: nMbtn,
            ),
          ),
        ],
      ),
    );
  }
}

class BKCard extends StatelessWidget {
  final bool active;
  final IconData icon;
  final String label;

  const BKCard({required this.active, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: nMbox,
      child: Row(
        children: <Widget>[
          SizedBox(width: MediaQuery.of(context).size.width / 40),
          Icon(icon, color: fCL),
          const SizedBox(width: 15),
          SizedBox(width: MediaQuery.of(context).size.width / 20),
          Container(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                color: fCD,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 20),
          Container(
            decoration: active ? nMboxInvertActive : nMboxInvert,
            width: 70,
            height: 70,
            child: Container(
              margin: active
                  ? const EdgeInsets.fromLTRB(35, 5, 5, 5)
                  : const EdgeInsets.fromLTRB(5, 5, 35, 5),
              decoration: nMbtn,
            ),
          ),
        ],
      ),
    );
  }
}

class CreditCard extends StatefulWidget {
  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: nMbox,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Мир',
                style: TextStyle(fontSize: 18),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'CVV',
                            hintStyle: TextStyle(fontSize: 14),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(3),
                            FilteringTextInputFormatter.allow(
                              RegExp("[0-9]"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 25,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 20,
              ),
              SizedBox(
                width: 210,
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: '****    ****    ****    ****',
                    hintStyle: TextStyle(fontSize: 18),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(19),
                    FilteringTextInputFormatter.digitsOnly,
                    CustomInputFormatter()
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 60,
                  ),
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        hintText: 'Владелец карты',
                        hintStyle: TextStyle(fontSize: 15),
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(30),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 8,
                  ),
                  SizedBox(
                    width: 70,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8.0),
                        hintText: 'ММ / ГГ',
                        hintStyle: TextStyle(fontSize: 13),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(5),
                        FilteringTextInputFormatter.digitsOnly,
                        CustomInputFormatterExpiries(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TransactionSlider extends StatefulWidget {
  @override
  State<TransactionSlider> createState() => _TransactionSliderState();
}

class _TransactionSliderState extends State<TransactionSlider> {
  double translimit = 1250;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            ),
            SizedBox(
              width: 150,
              child: Text(
                'Лимит',
                style: TextStyle(
                    color: fCD, fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 6,
            ),
            SizedBox(
              width: 75,
              child: Text('${translimit.toStringAsFixed(0)} P'),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.green.shade300,
            inactiveTrackColor: fCL.withOpacity(0.25),
            trackHeight: 5,
            thumbColor: mCL,
            overlayColor: mCL.withOpacity(0.75),
          ),
          child: Slider(
            value: translimit,
            min: 1,
            max: 300000,
            onChanged: (limitInput) {
              setState(() {
                translimit = limitInput;
              });
            },
          ),
        ),
      ],
    );
  }
}
