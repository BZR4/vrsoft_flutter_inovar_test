import 'package:flutter/material.dart';

class AlunosPage extends StatelessWidget {
  const AlunosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alunos'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: CircleAvatar(child: Text('$index')),
              title: Text('Aluno ds Silva, $index'),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Wrap(
                  runAlignment: WrapAlignment.end,
                  spacing: 8,
                  children: [
                    Chip(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        label: Text('DSM')),
                    Chip(label: Text('ADM')),
                    Chip(label: Text('SI'))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
