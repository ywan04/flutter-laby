import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './reset_password_screen.dart';
import './signup_screen.dart';

class SignInScreen extends StatefulWidget {
	const SignInScreen({super.key});
	@override
	_SignInScreenState createState() => _SignInScreenState();
}


class _SignInScreenState extends State<SignInScreen> {
	final _formKey = GlobalKey<FormState>();
	final _dio = Dio();
	String? _email;
	String? _password;

	@override
		Widget build(BuildContext context) {
			return Scaffold(
					body: Padding(
						padding: EdgeInsets.symmetric(horizontal: 16.0),
						child: Form(
							key: _formKey,
							child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
							Center(
								child: Image.network(
									"https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1024px-Google-flutter-logo.svg.png",
									width: 200,
									),
								),

							const SizedBox(height: 24.0),

							Row(
								children: [
								Expanded(
									child: TextFormField(
										obscureText: false,
										decoration: InputDecoration(
											labelText: 'Email',
										),
										validator: (String? value) {
											_email = value;
											if (value == null || value.isEmpty) {
												return "Email cannot be empty!";
											}
											if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
												return "Invalid email!";
											}
											return null;
										},
									),
									)
								],
								),

							const SizedBox(height: 16.0),

							Row(
								children: [
								Expanded(
									child: TextFormField(
										obscureText: true,
										decoration: InputDecoration(
											labelText: 'Password',
										),
										validator: (String? value) {
											_password = value;
											if (value == null || value.isEmpty) {
												return "Password cannot be empty!";
											}
											return null;
										},
									),
									)
								],
								),

							const SizedBox(height: 16.0),

							Row(
									children: [
									Expanded(
										child: SizedBox(
											height: 48,
											child: OutlinedButton(
											onPressed: () =>	 {
											Navigator.push(
													context,
													MaterialPageRoute(
														builder: (context) => const SignupScreen(),
														),
													)
											},
child: const Text("Sign up"),
),
											),
										),

							const SizedBox(width: 16.0),
							],
							),
							const SizedBox(height: 16.0),
							Row(
									children: [
									Expanded(
										child: SizedBox(
											height: 48,
											child: ElevatedButton(
												onPressed: () {
													final isValid = _formKey.currentState?.validate();
													if (isValid == true) {
														_dio.get(
															'https://ywan04.requestcatcher.com/signin',
															queryParameters: {'email': _email, 'password': _password},
														);
														showDialog(
																context: context,
																builder: (BuildContext ctx) {
																return const AlertDialog(
																		title: Text('Message'),
																		content: Text("request was sent"),
																		);
																},
																);
													}
												},
child: const Text("Login"),
),
											),
										),

							const SizedBox(width: 16.0),

							Expanded(
									child: SizedBox(
										height: 48,
										child: TextButton(
											onPressed: () =>	 {
											Navigator.push(
													context,
													MaterialPageRoute(
														builder: (context) => const ResetPasswordScreen(),
														),
													)
											},
child: const Text("Reset password"),
),
										),
									),

							const SizedBox(width: 16.0),
							],
							),
							],
							),
							),
							),
							);
		}
}
