import 'package:money_converter/app/components/currency_box.dart';
import 'package:money_converter/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toTextController = TextEditingController();
  final TextEditingController fromTextController = TextEditingController();

  late final HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(
      toTextController: toTextController,
      fromTextController: fromTextController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo_converter.png',
                  width: 250,
                  height: 250,
                ),
                SizedBox(height: 30),
                Text(
                  'DE:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),
                CurrencyBox(
                  selectedItem: homeController.fromCurrency,
                  items: homeController.currencies,
                  controller: toTextController,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model;
                    });
                  },
                ),

                SizedBox(height: 20),

                IconButton(
                  onPressed: () {
                    setState(() {
                      homeController.swapCurrencies();
                    });
                  },
                  icon: Icon(Icons.swap_vert, size: 32, color: Colors.blue),
                ),

                SizedBox(height: 20),

                Text(
                  'PARA:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),
                CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  items: homeController.currencies,
                  controller: fromTextController,
                  isReadOnly: true,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model;
                    });
                  },
                ),

                SizedBox(height: 30),

                if (homeController.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      homeController.errorMessage!,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),

                ElevatedButton(
                  onPressed: homeController.isLoading
                      ? null
                      : () async {
                          await homeController.convert();
                          setState(() {}); // Atualiza a tela
                        },
                  style: ButtonStyle(
                    mouseCursor: WidgetStateProperty.all(
                      SystemMouseCursors.click,
                    ),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                  ),
                  child: homeController.isLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text('CONVERTER'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
