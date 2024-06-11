import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_retrofit/addcard_page.dart';
import 'package:full_retrofit/card_item.dart';
import 'package:full_retrofit/repository.dart';
import 'package:full_retrofit/util.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final _repo = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ananas Bank"),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const AddCardPage()));
          }, icon: const Icon(CupertinoIcons.add_circled))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: FutureBuilder(
          future: _repo.getMyCards(),
          builder: (context, snapshot) {
            if(snapshot.data != null && snapshot.data?.isNotEmpty == true) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return CardItem(card: snapshot.data![index], onLongPress: () => _deleteCard(snapshot.data![index].id ?? ""));
                },
              );
            }
             else if (snapshot.data == null || snapshot.data?.isEmpty == true) {
              return const Center(child: Text("No Cards"));
            }
            else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  _deleteCard(String id) {
    _repo.deleteCard(id).then((value) {
      if(value) {
        showSuccess(context, "Successfully deleted");
        setState(() {});
      } else {
        showError(context, "Error occurred");
      }
    });
  }
}
