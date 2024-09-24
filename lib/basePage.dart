import 'package:flutter/material.dart';

class baseWidget extends StatefulWidget {
  const baseWidget({super.key});

  @override
  State<baseWidget> createState() => _baseWidgetState();
}

class _baseWidgetState extends State<baseWidget> {
  int heightV = 150;
  int weightV = 50;
  double result = 0;
  String condition = "";

  void calculateBmi(int height, int weight) {
    double meters = height / 100;

    result = weight / (meters * meters);

    if (result < 18.5) {
      condition = "Underweight";
    } else if (result < 24.9) {
      condition = "Healthy Weight";
    } else if (result < 29.9) {
      condition = "Overweight";
    } else {
      condition = "Obesity";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "BMI Calculator",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    const Text("Your Weight(Kg)"),
                    const Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          if (weightV < 200) {
                            weightV++;
                            calculateBmi(heightV, weightV);
                          }
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                    const Spacer(),
                    Text(
                      "$weightV",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          if (weightV > 30) {
                            weightV--;
                            calculateBmi(heightV, weightV);
                          }
                        });
                      },
                      child: const Icon(Icons.remove),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    const Text("Your Height(cm)"),
                    const Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          if (heightV < 200) {
                            heightV++;
                            calculateBmi(heightV, weightV);
                          }
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                    const Spacer(),
                    Text(
                      "$heightV",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          if (heightV > 50) {
                            heightV--;
                            calculateBmi(heightV, weightV);
                          }
                        });
                      },
                      child: const Icon(Icons.remove),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Result",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "$result",
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                height: 200,
                color: const Color.fromARGB(255, 215, 163, 254),
                child: Center(
                    child: Text(
                  condition,
                  style: const TextStyle(
                      color: Color.fromARGB(221, 47, 0, 255), fontSize: 29),
                )),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
