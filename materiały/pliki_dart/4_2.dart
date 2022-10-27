import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Example4_2 extends StatelessWidget {
  const Example4_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: ListView(
              children: [
                _buildImage(),
                _buildTitle(context),
                _buildActions(context),
                Expanded(child: _builText()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildAction(context, 'CALL', Icons.call),
        _buildAction(context, 'ROUTE', Icons.navigation),
        _buildAction(context, 'SHARE', Icons.share),
      ],
    );
  }

  Widget _builText() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        'The term Bieszczady has been introduced into English from Polish. In Poland, the term usually refers (in the narrower sense) to the Polish part of the Bieszczady region, while in the wider sense it can also refer to the entire region. In Slovakia, the Bieszczady region is known as Beščady (Slovak: Beščady), while the Slovak part of the region is called Bukovec Mountains (Slovak: Bukovské vrchy). In Ukraine, the Bieszczady region is known as Ukrainian: Бещади (Beščady), while various parts of the region often have two or more name variants (unstable terminology), usually containing the word Beščady in combination with some other terms. Historically, the terms Bieszczady/Beščady/Бещади have been used for hundreds of years to describe the mountains separating the old Kingdom of Hungary from Poland. A Latin language source of 1269 refers to them as "Beschad Alpes Poloniae" (translated as: Bieszczady Mountains of Poland).',
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildAction(BuildContext context, String label, IconData icon) {
    return Column(
      children: [
        IconButton(
          onPressed: () => print("TODO"),
          icon: Icon(icon),
          color: Colors.blue,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.blue,
              ),
        )
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bieszczady',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Polska, Solina',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.redAccent,
          ),
          SizedBox(
            width: 4,
          ),
          Text('41'),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Row(
      children: [
        Expanded(
          child: Image.asset(
            'assets/mountains.jpeg',
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
