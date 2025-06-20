import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  final double initialValue;

  const SliderPage({Key? key, this.initialValue = 50}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 50;

  @override
  void initState() {
    super.initState();
    _sliderValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider-Seite')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Slider(
              min: 0,
              max: 100,
              value: _sliderValue,
              divisions: 100,
              label: _sliderValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            Text('Aktueller Wert: ${_sliderValue.toStringAsFixed(0)}'),
            const SizedBox(height: 20),
            Container(
              width: 100 + _sliderValue,
              height: 100 + _sliderValue,
              color: Color.lerp(Colors.blue, Colors.red, _sliderValue / 100),
            ),
          ],
        ),
      ),
    );
  }
}

