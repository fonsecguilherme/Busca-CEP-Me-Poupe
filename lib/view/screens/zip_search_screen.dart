import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:procura_cep/network/via_cep_network.dart';

import '../../style.dart';

class ZipSearchScreen extends StatefulWidget {
  const ZipSearchScreen({Key? key}) : super(key: key);

  @override
  State<ZipSearchScreen> createState() => _ZipSearchState();
}

class _ZipSearchState extends State<ZipSearchScreen> {
  final _searchZipController = TextEditingController();
  // bool _loading = false;
  // bool _enableField = true;
  late String _result = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildSearchBarWidget(context),
            _buildResultForm()
          ],
        ),
      );

  Container _buildSearchBarWidget(BuildContext newContext) => Container(
        color: Style.purpleColor,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40, left: 32, bottom: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Procurar CEP',
                  style: Style.largerTextStyleWhite,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const Text(
              'Digite o CEP que você\ndeseja procurar',
              style: Style.searcBarText01,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 15,
                left: 15,
                top: 25,
                bottom: 25,
              ),
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                controller: _searchZipController,
                decoration: InputDecoration(
                  labelText: 'Ex: 88330301',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: GestureDetector(
                      child: const Icon(
                        CupertinoIcons.search,
                        color: Style.greyColor,
                      ),
                      onTap: () => _searchZip() //! bloc aqui
                      ),
                  disabledBorder: InputBorder.none,
                  filled: true,
                  fillColor: Style.whiteColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45.0),
                  ),
                ),
              ),
            )
          ],
        ),
      );

  void _searchZip() async {
    final zip = _searchZipController.text;

    final resultZip = await ViaCepNetwork.fetchCep(zip: zip);

    String logradouro = resultZip.logradouro;
    String bairro = resultZip.bairro;
    String localidade = resultZip.localidade;
    String uf = resultZip.uf;
    String cep = resultZip.cep;

    String endereco = '$logradouro - $bairro - $localidade $uf - CEP $cep ';

    setState(() {
      _result = endereco;
    });
  }

  Widget _buildResultForm() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Endereço:',
              style: Style.resultNetwork01,
            ),
            Text(
              _result,
              style: Style.resultNetwork02,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchZipController.dispose();
    super.dispose();
  }
}
