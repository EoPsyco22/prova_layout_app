
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prova Layout App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Dashboard de Registros',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.primaryContainer,
        title: Text(widget.title),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            // DESAFIO 2:
            // Centralizar os elementos da Column principal
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              // ==================================
              // DESAFIO 1 - CARDS DE ESTATÍSTICAS
              // ==================================

              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius:
                            BorderRadius.circular(8),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.insert_drive_file,
                            color: Colors.blue,
                          ),
                          Text(
                            '12',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Docs'),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius:
                            BorderRadius.circular(8),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.remove_red_eye,
                            color: Colors.blue,
                          ),
                          Text(
                            '145',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Visitas'),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius:
                            BorderRadius.circular(8),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: Colors.blue,
                          ),
                          Text(
                            '45',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Fotos'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ==================================
              // DESAFIO 6 - MATERIAL CARD
              // ==================================
              // Container substituído por Card
              // Mantendo Stack e Positioned do Desafio 5

              SizedBox(
                width: double.infinity,

                child: Card(
                  // DESAFIO 6: elevação do Material
                  elevation: 4,

                  color: Colors.amber.shade100,

                  margin: EdgeInsets.zero,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  clipBehavior: Clip.antiAlias,

                  child: Stack(
                    children: [
                      // Conteúdo principal do Card
                      const Padding(
                        padding: EdgeInsets.fromLTRB(
                          16, 48, 16, 56,
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Item em Destaque',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(
                              'Este é o card de destaque principal que será customizado com Stack e Material Card.',
                            ),
                          ],
                        ),
                      ),

                      // ==================================
                      // DESAFIO 5 - PRIMEIRO SELO
                      // ==================================

                      Positioned(
                        top: 10,
                        right: 10,

                        child: Container(
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius:
                                BorderRadius.circular(20),
                          ),

                          child: const Text(
                            'Destaque',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),

                      // ==================================
                      // DESAFIO 5 - SEGUNDO SELO
                      // CONFIRMADO - INFERIOR ESQUERDO
                      // ==================================

                      Positioned(
                        bottom: 10,
                        left: 10,

                        child: Container(
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 7,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.circular(20),
                          ),

                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.white,
                                size: 16,
                              ),

                              SizedBox(width: 6),

                              Text(
                                'Confirmado',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ==================================
              // DESAFIO 3 - ÚLTIMOS REGISTROS
              // ==================================

              const Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Últimos Registros',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Icon(
                    Icons.history,
                    color: Colors.blue,
                    size: 28,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.description,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'Documento registrado',
                  ),
                  subtitle: Text(
                    'Registro recente',
                  ),
                  trailing:
                      Icon(Icons.chevron_right),
                ),
              ),

              const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.camera_alt,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'Nova foto adicionada',
                  ),
                  subtitle: Text(
                    'Registro recente',
                  ),
                  trailing:
                      Icon(Icons.chevron_right),
                ),
              ),

              const SizedBox(height: 24),

              // ==================================
              // DESAFIO 4 - RENDERFLEX OVERFLOW
              // ==================================

              const Text(
                'Tratamento de Overflow',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // Exemplo com erro proposital
              const Text(
                'Exemplo com erro:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),

              const SizedBox(height: 10),

              Container(
                width: 250,
                padding: const EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius:
                      BorderRadius.circular(8),
                ),

                child: const Row(
                  children: [
                    Icon(
                      Icons.warning,
                      color: Colors.red,
                    ),

                    SizedBox(width: 10),

                    // Overflow proposital
                    Text(
                      'Este texto é muito grande e ultrapassa o limite disponível da Row',
                      softWrap: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Exemplo corrigido
              const Text(
                'Exemplo corrigido:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 10),

              Container(
                width: 250,
                padding: const EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius:
                      BorderRadius.circular(8),
                ),

                child: const Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),

                    SizedBox(width: 10),

                    // Correção com Expanded
                    Expanded(
                      child: Text(
                        'Este texto é muito grande e ultrapassa o limite disponível da Row',
                        maxLines: 1,
                        overflow:
                            TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'O Expanded e o TextOverflow.ellipsis corrigem o problema de RenderFlex overflow.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

