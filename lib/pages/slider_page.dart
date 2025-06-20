import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  final double initialValue;
  final ValueChanged<double> onChanged;

  const SliderPage({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider-Seite')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Slider(
              value: _currentValue,
              min: 0,
              max: 100,
              divisions: 100,
              label: _currentValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  _currentValue = value;
                });
                widget.onChanged(value);
              },
            ),
            Text('Aktueller Wert: ${_currentValue.toStringAsFixed(0)}'),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: _currentValue / 100,
            ),
            const SizedBox(height: 20),
            Container(
              width: _currentValue + 50,
              height: 50,
              color: Colors.blue.withOpacity(_currentValue / 100),
            ),
          ],
        ),
      ),
    );
  }
}

