import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exercise_2/Bloc/BlocCapital.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Exercise 2 Day 5'),
          ),
          body: BlocProvider(
            create: (context) => TextChainCubit(),
            child: InputName(),
          ),
        ));
  }
}

class InputName extends StatefulWidget {
  const InputName({Key? key}) : super(key: key);

  @override
  _InputNameState createState() => _InputNameState();
}

class _InputNameState extends State<InputName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 45),
      child: Column(
        children: [
          BlocBuilder<TextChainCubit, String>(
            builder: (context, state) {
              return TextField(
                obscureText: false,
                onChanged: (String? text) {
                  context.read<TextChainCubit>().setTextChain(text ?? "-");
                  context.read<TextChainCubit>().toUpperChase();
                },
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Enter Text'),
              );
            },
          ),
          BlocConsumer<TextChainCubit, String>(
            listener: (context, state) {},
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                child: Text(state),
              );
            },
          )
        ],
      ),
    );
  }
}
