import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class V0 extends StatefulWidget {
  @override
  State<V0> createState() => _V0State();
}

class _V0State extends State<V0> {
  final double _size = 100.0;

  @override
  Widget build(BuildContext context) {
		final _provider = Provider.of<RadiusProvider>(context);

			return Column(
			crossAxisAlignment: CrossAxisAlignment.center,
      children: [
				const SizedBox(height: 20.0),
        Container(
          width: _size,
          height: _size,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(_provider.radius.tr),
              topLeft: Radius.circular(_provider.radius.tl),
              bottomRight: Radius.circular(_provider.radius.br),
              bottomLeft: Radius.circular(_provider.radius.bl),
              ),
          ),
        ),
				const SizedBox(height: 20.0),
				Column(
					crossAxisAlignment: CrossAxisAlignment.center,
					children: [
						Row(
							children: [
								Column(
									children: [
										Row(
											children: [
												const Text("TL: "),
												Text(_provider.radius.tl.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold),),
											],
										),
										Slider(value: _provider.radius.tl, min: 0, max: 100, onChanged: _provider.updateTL),
									],
								),
								Column(
									children: [
										Row(
											children: [
												const Text("TR: "),
												Text(_provider.radius.tr.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold),),
											],
										),
										Slider(value: _provider.radius.tr, min: 0, max: 100, onChanged: _provider.updateTR),
									],
								),
							],
						),
						Row(
							children: [
								Column(
									children: [
										Row(
											children: [
												const Text("BL: "),
												Text(_provider.radius.bl.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold),),
											],
										),
										Slider(value: _provider.radius.bl, min: 0, max: 100, onChanged: _provider.updateBL),
									],
								),
								Column(
									children: [
										Row(
											children: [
												const Text("BR: "),
												Text(_provider.radius.br.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold),),
											],
										),
										Slider(value: _provider.radius.br, min: 0, max: 100, onChanged: _provider.updateBR),
									],
								),
							],
						),
					],
				),
      ],
		);
  }
}
