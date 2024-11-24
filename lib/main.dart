import 'package:flutter/material.dart';

void main() {
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'lab10',
			theme: ThemeData(
				colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
				useMaterial3: true,
			),
			home: const MyHomePage(title: 'Text previewer'),
		);
	}
}

class MyHomePage extends StatefulWidget {
	const MyHomePage({super.key, required this.title});
	final String title;

	@override
	State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	String _text = "";
	double _fontSize = 10.0;

	String getMessage(String? result) {
		if (result == 'Ok') {
			return 'Cool!';
		} else if (result == 'Cancel') {
			return 'Let’s try something else.';
		}
		return 'Don\'t know what to say.';
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Theme.of(context).colorScheme.inversePrimary,
				title: Text(widget.title),
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						TextField(
							onChanged: (value) {
								setState(() {
									_text = value;
								});
							},
							decoration: InputDecoration(
								labelText: 'Text',
								helperText: 'Enter some text',
								border: OutlineInputBorder(),
								enabledBorder: OutlineInputBorder(
									borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
								),
								focusedBorder: OutlineInputBorder(
									borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
								),
							),
						),
						Row(
							children: <Widget>[
								Text("Font size: ${_fontSize.toInt()}"),
								Expanded(
									child: Slider(
										value: _fontSize,
										min: 10.0,
										max: 100.0,
										onChanged: (value) {
											setState(() {
												_fontSize = value;
											});
										}
									),
								),
							],
						),
						ElevatedButton(
								onPressed: () async {
								final result = await Navigator.push(
									context,
									MaterialPageRoute(
										builder: (context) => PreviewScreen(
											text: _text,
											fontSize: _fontSize,
										),
									),
								);

								showDialog(
									context: context,
									builder: (context) => AlertDialog(
										content: Column(
											mainAxisSize: MainAxisSize.min,
											children: [
												Image.network(
													"https://emojiisland.com/cdn/shop/products/Robot_Emoji_Icon_abe1111a-1293-4668-bdf9-9ceb05cff58e_large.png?v=1571606090",
													width: 50,
												),
												const SizedBox(height: 10),
												Text(getMessage(result)),
											],
										),
									),
								);
							},
							style: ElevatedButton.styleFrom(
								foregroundColor: Colors.white,
								backgroundColor: Theme.of(context).primaryColor,
							),
							child: const Text('Preview'),
						),
					],
				),
			),
		);
	}
}

class PreviewScreen extends StatelessWidget {
	final String text;
	final double fontSize;

	const PreviewScreen({super.key, required this.text, required this.fontSize});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Theme.of(context).colorScheme.inversePrimary,
				title: const Text('Preview'),
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Text(
							text,
							style: TextStyle(fontSize: fontSize),
						),
						const SizedBox(height: 15.0),
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								ElevatedButton(
									onPressed: () {
										Navigator.pop(context, 'Ok');
									},
									style: ElevatedButton.styleFrom(
										foregroundColor: Colors.white,
										backgroundColor: Theme.of(context).primaryColor,
									),
									child: const Text('Ok'),
								),
								ElevatedButton(
									onPressed: () {
										Navigator.pop(context, 'Cancel');
									},
									child: const Text('Cancel'),
								),
							],
						),
					],
				),
			),
		);
	}
}

