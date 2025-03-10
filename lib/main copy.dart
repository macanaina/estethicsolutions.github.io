import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

// Colores de la marca
const Color primaryColor = Color(0xFF007BFF); // Un azul moderno, puedes cambiarlo
const Color secondaryColor = Color(0xFF6C757D); // Gris secundario

void main() {
  runApp(MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/productos',
      builder: (context, state) => const ProductosPage(),
    ),
    GoRoute(
      path: '/contacto',
      builder: (context, state) => const ContactoPage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
    routerConfig: _router,
      title: 'Esthetic Solutions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(primaryColor),
        fontFamily: 'Roboto',
      ),
    );
  }
}

// Función para crear un MaterialColor a partir de un Color
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Esthetic Solutions'),
        actions: [
          TextButton(
            onPressed: () => context.go('/productos'),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Productos'),
          ),
          TextButton(
            onPressed: () => context.go('/contacto'),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Contacto'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nuestros Servicios Destacados',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 20),
                  const StaticProductDisplay(), // Reemplaza el carrusel
                  const SizedBox(height: 30),
                  Text('¿Por qué elegirnos?',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 20),
                  const WhyChooseUsSection(),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class ProductosPage extends StatelessWidget {
  const ProductosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuestros Productos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: const [
          ProductCard(
            name: 'HIFU (Ultrasonido Focalizado de Alta Intensidad)',
            description:
                'Equipo de rejuvenecimiento facial no invasivo que utiliza ondas de ultrasonido para estimular la producción de colágeno.',
            imageUrl: 'assets/hifu.jpg', // Reemplaza con tu imagen
          ),
          ProductCard(
            name: 'Body Sculpting (Escultura Corporal)',
            description:
                'Tecnología avanzada para la eliminación de grasa localizada y la tonificación muscular sin cirugía.',
            imageUrl: 'assets/body_sculpting.jpg', // Reemplaza con tu imagen
          ),
          ProductCard(
            name: 'Recarga de Cartuchos',
            description:
                'Servicio de recarga y mantenimiento de cartuchos para equipos de estética, garantizando su óptimo rendimiento.',
            imageUrl: 'assets/cartuchos.jpg', // Reemplaza con tu imagen
          ),
          ProductCard(
            name: 'Otros Equipos Estéticos',
            description:
                'Amplia variedad de equipos para tratamientos faciales y corporales. ¡Consulte nuestro catálogo completo!',
            imageUrl: 'assets/otros_equipos.jpg', // Reemplaza con tu imagen
          ),
        ],
      ),
    );
  }
}

class ContactoPage extends StatelessWidget {
  const ContactoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacto'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: const ContactForm(),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Esthetic Solutions',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Equipos de estética de vanguardia para tu negocio.',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => context.go('/productos'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text('Ver Productos'),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;

  const ProductCard({super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover), // Muestra la imagen
            const SizedBox(height: 10),
            Text(name, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(description, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                //TODO: Implementar el envio de presupuesto
                _launchURL("https://wa.me/59899123456?text=Me%20interesa%20un%20presupuesto%20de%20$name"); // Reemplaza con tu número
              },
              child: const Text('Solicitar Presupuesto'),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nombre'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa tu nombre.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa tu email.';
                }
                if (!value.contains('@')) {
                  return 'Por favor, ingresa un email válido.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Mensaje'),
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa tu mensaje.';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // TODO: Implementar el envío del formulario (por ejemplo, a un servicio de email)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Enviando mensaje...')),
                  );
                }
              },
              child: const Text('Enviar Mensaje'),
            ),
            const SizedBox(height: 32),
            const ContactInfo(),
          ],
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contáctanos', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.phone),
          title: const Text('+598 99 123 456'), // Reemplaza con tu número
          onTap: () => _launchURL('tel:+59899123456'),
        ),
        ListTile(
          leading: const Icon(Icons.email),
          title: const Text('info@estheticsolutions.uy'), // Reemplaza con tu email
          onTap: () => _launchURL('mailto:info@estheticsolutions.uy'),
        ),
        ListTile(
          leading: const Icon(FontAwesomeIcons.whatsapp),
          title: const Text('WhatsApp'),
          onTap: () => _launchURL(
              'https://wa.me/59899123456'), // Reemplaza con tu número
        ),
      ],
    );
  }
}

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const WhyChooseUsCard(
          title: 'Calidad Garantizada',
          description:
              'Equipos de última generación con certificación de calidad.',
          icon: Icons.verified_user,
        ),
        const WhyChooseUsCard(
          title: 'Asesoramiento Profesional',
          description: 'Expertos a tu disposición para ayudarte a elegir.',
          icon: Icons.support_agent,
        ),
        const WhyChooseUsCard(
          title: 'Soporte Técnico',
          description: 'Mantenimiento y reparación de equipos.',
          icon: Icons.settings,
        ),
      ],
    );
  }
}

class WhyChooseUsCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const WhyChooseUsCard({super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: primaryColor),
            const SizedBox(height: 10),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(description, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryColor,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          '© 2024 Esthetic Solutions. Todos los derechos reservados.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

// Widget para mostrar las imágenes de los productos una debajo de otra
class StaticProductDisplay extends StatelessWidget {
  const StaticProductDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/hifu.jpg', height: 200, width: double.infinity, fit: BoxFit.cover),
        const SizedBox(height: 10),
        Image.asset('assets/body_sculpting.jpg', height: 200, width: double.infinity, fit: BoxFit.cover),
        const SizedBox(height: 10),
        Image.asset('assets/cartuchos.jpg', height: 200, width: double.infinity, fit: BoxFit.cover),
        const SizedBox(height: 10),
        Image.asset('assets/otros_equipos.jpg', height: 200, width: double.infinity, fit: BoxFit.cover),
      ],
    );
  }
}

// Función para abrir URLs (tel, mail, WhatsApp)
_launchURL(String url) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'No se pudo abrir la URL $url';
  }
}