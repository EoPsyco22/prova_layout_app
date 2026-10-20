
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prova Layout App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dashboard de Registros'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Desafio 4: controle para demonstrar o overflow
  bool _simularOverflow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // Desafio 2: centralização da Column principal
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Desafio 1: três cards de estatística
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        children: [
                          Icon(Icons.insert_drive_file, color: Colors.blue),
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
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        children: [
                          Icon(Icons.remove_red_eye, color: Colors.blue),
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
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        children: [
                          Icon(Icons.camera_alt, color: Colors.blue),
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

              // Card de destaque
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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

              const SizedBox(height: 24),

              // Desafio 3: seção Últimos Registros
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  title: Text('Documento registrado'),
                  subtitle: Text('Registro recente'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),

              const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.camera_alt,
                    color: Colors.blue,
                  ),
                  title: Text('Nova foto adicionada'),
                  subtitle: Text('Registro recente'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),

              const SizedBox(height: 24),

              // DESAFIO 4: demonstração de RenderFlex overflow
              const Text(
                'Desafio 4 - Tratamento de Overflow',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              SwitchListTile(
                title: const Text('Simular erro de Overflow'),
                subtitle: Text(
                  _simularOverflow
                      ? 'Erro ativado'
                      : 'Overflow corrigido',
                ),
                value: _simularOverflow,
                onChanged: (valor) {
                  setState(() {
                    _simularOverflow = valor;
                  });
                },
              ),

              const SizedBox(height: 12),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: SizedBox(
                    width: 260,
                    child: _simularOverflow
                        // Exemplo com erro proposital
                        ? const Row(
                            children: [
                              Icon(Icons.warning, color: Colors.red),
                              SizedBox(width: 10),
                              Text(
                                'Este texto é muito longo e ultrapassa o espaço disponível na tela causando RenderFlex overflow',
                                softWrap: false,
                              ),
                            ],
                          )

                        // Correção com Expanded
                        : const Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.green),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Este texto é muito longo e ultrapassa o espaço disponível na tela causando RenderFlex overflow',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Text(
                _simularOverflow
                    ? 'Erro: RenderFlex overflow demonstrado.'
                    : 'Correção aplicada com Expanded e TextOverflow.ellipsis.',
                style: TextStyle(
                  color: _simularOverflow
                      ? Colors.red
                      : Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

