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
  late String _result = 'Seu endereço irá aparecer aqui!';

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
            _buildSearchBarWidget(),
            _buildResultForm()
          ],
        ),
      );

  Container _buildSearchBarWidget() => Container(
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
                    onTap: () => _searchZip(),
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
            _savedZipsBar()
          ],
        ),
      ),
    );
  }

  Padding _savedZipsBar() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Style.darkerPurpleColor,
            borderRadius: BorderRadius.circular(45.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  children: const <Widget>[
                    Icon(
                      CupertinoIcons.star,
                      color: Color(0XFFB4A5FD),
                      size: 20,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Adicionar aos favoritos',
                      style: Style.addFavoritesBar,
                    ),
                  ],
                ),
              ),
            ],
          ),
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

  @override
  void dispose() {
    _searchZipController.dispose();
    super.dispose();
  }
}
