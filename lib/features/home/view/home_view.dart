import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortly_url/core/component/button/custom_elevated_button.dart';
import 'package:shortly_url/core/extensions/context_extension.dart';
import 'package:shortly_url/features/home/viewmodel/home_viewmodel.dart';

import '../../../product/mixin/validation_mixin.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with ValidationMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewmodel(),
      builder: (context, child) {
        final viewmodel = Provider.of<HomeViewmodel>(context, listen: false);
        return Scaffold(
          body: Column(
            children: [
              const Expanded(flex: 73, child: Text("data")),
              Expanded(
                flex: 27,
                child: _formAndShortenButton(viewmodel),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _formAndShortenButton(HomeViewmodel viewmodel) {
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          Container(
            width: context.width,
            // height: context.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.indigo.shade900,
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: context.width * 0.6,
              height: (context.height * 0.27) / 1.6,
              decoration: BoxDecoration(
                color: Colors.indigo.shade300,
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(150)),
              ),
            ),
          ),
          SizedBox(
            width: context.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: context.width * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    validator: (value) => validateNullCheck(value),
                    controller: _textEditingController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: context.paddingLow,
                      hintText: "Shorten s link here...",
                    ),
                  ),
                ),
                CustomElevatedButton(
                    ontap: () async {
                      await _shortenOperation(viewmodel);
                    },
                    text: "SHORTEN IT!",
                    context: context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _shortenOperation(HomeViewmodel viewmodel) async {
    viewmodel.autovalidateMode = AutovalidateMode.always;
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      viewmodel.autovalidateMode = AutovalidateMode.disabled;
      // await viewmodel.shortenLink(_textEditingController.text);
    }
  }
}
