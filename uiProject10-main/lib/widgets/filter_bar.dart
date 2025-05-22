import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/imat_data_handler.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({Key? key}) : super(key: key);

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  static const double sliderMax = 300;

  RangeValues _priceRange = const RangeValues(0, sliderMax);
  bool _ecoOnly = false;

  late TextEditingController _minController;
  late TextEditingController _maxController;

  @override
  void initState() {
    super.initState();
    _minController = TextEditingController(text: '0');
    _maxController = TextEditingController(text: sliderMax.toInt().toString());
  }

  @override
  void dispose() {
    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }

  void _syncFromTextFields() {
    final min = double.tryParse(_minController.text) ?? _priceRange.start;
    final max = double.tryParse(_maxController.text) ?? _priceRange.end;
    setState(() {
      _priceRange = RangeValues(
        min.clamp(0, sliderMax),
        max.clamp(0, sliderMax),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Two‐thirds of screen width
    final width = MediaQuery.of(context).size.width * 2 / 3;

    return SizedBox(
      width: width,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Filter",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),
            const Text(
              "Pris",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),

            // Slider + Min/Max
            Row(
              children: [
                Expanded(
                  child: RangeSlider(
                    values: _priceRange,
                    min: 0,
                    max: sliderMax,
                    divisions: 30,
                    onChanged: (r) {
                      setState(() {
                        _priceRange = r;
                        _minController.text = r.start.round().toString();
                        _maxController.text = r.end.round().toString();
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 70,
                  child: TextField(
                    controller: _minController,
                    keyboardType:
                    const TextInputType.numberWithOptions(decimal: false),
                    decoration: const InputDecoration(
                      isDense: true,
                      labelText: 'Min',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                SizedBox(
                  width: 70,
                  child: TextField(
                    controller: _maxController,
                    keyboardType:
                    const TextInputType.numberWithOptions(decimal: false),
                    decoration: const InputDecoration(
                      isDense: true,
                      labelText: 'Max',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Eco + Apply
            Row(
              children: [
                Checkbox(
                  value: _ecoOnly,
                  onChanged: (v) => setState(() => _ecoOnly = v!),
                ),
                const Text("Ekologisk"),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // 1) Sync the text fields into the slider state
                    _syncFromTextFields();

                    // 2) Apply the filter *on top* of the left‐panel’s base selection
                    context.read<ImatDataHandler>().applyFilter(
                      minPrice: _priceRange.start,
                      maxPrice: _priceRange.end,
                      ecoOnly: _ecoOnly,
                    );
                  },
                  child: const Text("Visa"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}