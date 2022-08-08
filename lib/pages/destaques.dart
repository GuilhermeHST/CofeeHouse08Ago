import 'package:coffeehouse/domain/sessao_cafe.dart';
import 'package:coffeehouse/data/banco_dados.dart';
import 'package:flutter/material.dart';
import 'package:coffeehouse/widget/card_sessao_cafe.dart';

class DestaquesPage extends StatefulWidget {
  const DestaquesPage({Key? key}) : super(key: key);

  @override
  State<DestaquesPage> createState() => _DestaquesPageState();
}

class _DestaquesPageState extends State<DestaquesPage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(padding: const EdgeInsets.all(16.0));
    child:
    FutureBuilder<List<SessaoCafe>>(
        future: BancoDados.getValues(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<SessaoCafe>? listaCafe = snapshot.data ?? [];
            return ListView(
              children: [
                buildContainerCafe(),
                const SizedBox(height: 16),
                buildListViewBuilder(listaCafe),
              ],
            );
          }
        });
  }

  buildListViewBuilder(List<SessaoCafe> listaCafes) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: listaCafes.length,
      itemBuilder: (context, index) {
        return CardSessaoCafe(
          sessaoCafe: listaCafes[index],
        );
      },
    );
  }

  buildContainerCafe() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF3E2723),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'QUER UM CAFÉ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'O melhor do café na palma da sua mão!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                buildImage('https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Cup-o-cofee-no-spoon.svg/2560px-Cup-o-cofee-no-spoon.svg.png'),
              ],
            ),
          ),
          /*const Placeholder(
                  
                )*/
        ],
      ),
    );
  }

  buildImage(final String imagem) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
          ),
          child: Image.network(imagem),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16, top: 20),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
        ),
      ],
    );
  }
}
