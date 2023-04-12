import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:objectbox/objectbox.dart';
import 'package:vrsoft_flutter_inovar_test/components/text_input.dart';
import 'package:vrsoft_flutter_inovar_test/entities/aluno_entity.dart';
import 'package:vrsoft_flutter_inovar_test/entities/curso_entity.dart';
import 'package:vrsoft_flutter_inovar_test/entities/user_entity.dart';
import 'package:vrsoft_flutter_inovar_test/features/alunos/aluno_matricula.dart';
import 'package:vrsoft_flutter_inovar_test/features/alunos/aluno_model.dart';
import 'package:vrsoft_flutter_inovar_test/features/alunos/alunos_page.dart';
import 'package:vrsoft_flutter_inovar_test/features/cursos/curso_model.dart';
import 'package:vrsoft_flutter_inovar_test/features/cursos/curso_page.dart';
import 'package:vrsoft_flutter_inovar_test/features/cursos/cursos_page.dart';
import 'package:vrsoft_flutter_inovar_test/objectbox.g.dart';
import 'package:vrsoft_flutter_inovar_test/objectbox_store.dart';

import './app_widget.dart';

late ObjectBox objectbox;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   objectbox = await ObjectBox.create();
//   WidgetsFlutterBinding.ensureInitialized();

//   runApp() => const MyApp();
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // objectbox = await ObjectBox.create();

  runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ),
  );
}

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton<Future<ObjectBox>>((i) => ObjectBox.create()),
        Bind.singleton<Future<Store>>(
            (i) => i.get<Future<ObjectBox>>().then((value) => value.store)),
        ...AppBindings().binds,
        // Bind.singleton<Future<Box<Curso>>>(
        //     (i) => i.get<Future<Store>>().then((value) => value.box<Curso>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) =>
              // CursosPage(cursos: objectbox.store.box<Curso>().getAll()),
              CursoPage(),
        ),
        ChildRoute(
          '/curso',
          child: (context, args) => const CursoPage(),
        ),
        ChildRoute(
          '/matricula',
          child: (context, args) => AlunoMatriculaPage(cursos: args.data),
        ),
      ];
}

abstract class BaseBindings {
  List<Bind> get boxes;
}

class AppBindings extends BaseBindingsImpl {
  @override
  final List<Bind<Future<Box>>> boxes = [
    Bind.singleton<Future<Box<Curso>>>(
        (i) => i.get<Future<Store>>().then((value) => value.box<Curso>())),
    Bind.singleton<Future<Box<Aluno>>>(
        (i) => i.get<Future<Store>>().then((value) => value.box<Aluno>())),
  ];
}

class BaseBindingsImpl implements BaseBindings {
  @override
  List<Bind> get binds => [...boxes];

  @override
  List<Bind<Future<Box>>> get boxes => [];
}

/*
CursoPage(
            curso: CursoModel(
                id: 1,
                descricao: 'Desenvolvimento de Sistemas Multiplataforma',
                ementa:
                    'Lorem ipsum dolor sit Amet. Lorem ipsum dolor sit Amet. Lorem ipsum dolor sit Amet. Lorem ipsum dolor sit Amet. Lorem ipsum dolor sit Amet. ',
                alunos: [
                  AlunoModel(id: 1, nome: 'Esdras B Silva'),
                  AlunoModel(id: 2, nome: 'Enzo gabriel G S Silva'),
                  AlunoModel(id: 3, nome: 'Erika G S Silva'),
                  AlunoModel(id: 1, nome: 'Esdras B Silva'),
                  AlunoModel(id: 2, nome: 'Enzo gabriel G S Silva'),
                  AlunoModel(id: 3, nome: 'Erika G S Silva'),
                  AlunoModel(id: 1, nome: 'Esdras B Silva'),
                  AlunoModel(id: 2, nome: 'Enzo gabriel G S Silva'),
                  AlunoModel(id: 3, nome: 'Erika G S Silva'),
                ]),
          )
*/

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    // final userBox = objectbox.store.box<User>();
    // userBox.put(User(name: 'Esdras B Silva', date: DateTime.now()));
    // var user = userBox.get(1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(children: [
        Card(
          child: SizedBox(
            height: 200,
            // child: Text('${user!.name}'),
          ),
        ),
        Card(
          child: SizedBox(height: 200),
        ),
        Card(
          child: SizedBox(height: 200),
        ),
      ]),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppBar')),
      body: const Center(child: Text('This is initial page.')),
      bottomNavigationBar: BottomNavigationBar(currentIndex: 2, items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined),
            activeIcon: Icon(Icons.feed),
            label: 'Alunos'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorites'),
        BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            activeIcon: Icon(Icons.list),
            label: 'Matriculas')
      ]),
    );
  }
}

class SecondPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Modular.to.navigate('/'),
          child: Text('Back to Home'),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    var alunoBox = objectbox.store.box<Aluno>();
    var cursoBox = objectbox.store.box<Curso>();

    // var a1 = Aluno(nome: 'Esdras b Silva');
    var c2 = Curso(
        descricao: 'Sistemas para Internet',
        ementa:
            'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. ');

    // c1.aluno.target = a1;

    // var id_curso = cursoBox.put(c2);
    var curso = cursoBox.get(1);
    Aluno? a1 = alunoBox.get(1);
    // var a1 = Aluno(nome: 'Esdras b Silva');
    // var a2 = Aluno(nome: 'Enzo G S Silva');
    // var a3 = Aluno(nome: 'Erika G S Silva');
    curso!.alunos.add(a1!);
    a1.cursos.add(curso);

    // alunoBox.put(a1);

    cursoBox.put(curso);

    // cursoBox.put(curso);

    // print('Curso: ${curso.alunos}');

    // int idAluno = alunoBox.put(Aluno(nome: 'Esdras b Silva'));

    // int idCurso = cursoBox.put(Curso(
    //     descricao: 'Desenvolvimento de Sistemas Multiplataforma',
    //     ementa:
    //         'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. '));

    // var aluno = alunoBox.get(idAluno);
    // var curso = cursoBox.get(idCurso);

    var alunos = alunoBox.getAll();
    var cursos = cursoBox.getAll();

    // var c1 = cursoBox.get(1);

    print(alunos);
    print(cursos);

    Query<Aluno> query = alunoBox
        .query(Aluno_.nome.contains('esdras', caseSensitive: false))
        .build();

    var find = query.find();

    QueryBuilder<Aluno> builder =
        alunoBox.query(Aluno_.nome.contains('enzo', caseSensitive: false));

    builder.linkMany(Aluno_.cursos, Curso_.id.equals(2));

    Query<Aluno> busca = builder.build();

    var find2 = busca.find();

    print(find2);

    query.close();
    busca.close();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ObjectBox')),
      body: Column(
        children: const [
          SizedBox(
            height: 10,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: const Key('add'),
        label: const Text('Add Task'),
        heroTag: null,
        onPressed: () {},
      ),
    );
  }
}
