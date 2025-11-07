import 'package:flutter/material.dart';
// 1. Import nécessaire pour naviguer vers la page de gestion des rédacteurs
import 'redacteurs_interface.dart'; 

// ----------------------------------------------------------------
// 1. Point d'entrée de l'application
// ----------------------------------------------------------------
void main() {
  runApp(const MonAppli());
}

// ----------------------------------------------------------------
// 2. Widget racine (MonAppli) - Configuration du thème
// ----------------------------------------------------------------
class MonAppli extends StatelessWidget {
  const MonAppli({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magazine Infos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Utilise la couleur rose comme couleur primaire
        primarySwatch: Colors.pink,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink[700],
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Ajout du style pour les boutons pour correspondre au design de l'Activité 5
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 3,
          ),
        ),
      ),
      home: const PageAccueil(),
    );
  }
}

// ----------------------------------------------------------------
// 3. Widget PageAccueil (Scaffold principal)
// AJOUT du FloatingActionButton pour la navigation.
// ----------------------------------------------------------------
class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  // Fonction de navigation vers la page de gestion (Activité 5)
  void _navigateToEditorManagement(BuildContext context) {
    // Navigation vers la nouvelle page PageGestionRedacteurs
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RedacteursInterface(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magazine Infos'),
        centerTitle: true,
        leading: const Icon(Icons.menu), // Menu (leading)
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.search), // Recherche (actions)
          ),
        ],
      ),
      
      // Le corps de la page est un SingleChildScrollView pour permettre le défilement
      body: SingleChildScrollView(
        child: Column(
          // alignement à gauche du texte
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            // 1. Image principale 
            // Utilise Image.asset avec AssetImage
            Image(
              image: const AssetImage('asset/images/magazineInfo.jpg'),
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 200,
                color: Colors.grey[300],
                child: const Center(child: Text('Image indisponible: magazineInfo.jpg')),
              ),
            ),
            
            // 2. Titre de Bienvenue
            const PartieTitre(),

            // 3. Texte de Description
            const PartieTexte(),

            // 4. Icônes de Contact et Partage
            const PartieIcones(),
            
            // 5. Rubriques (deux images côte à côte)
            const PartieRubrique(),

            // Espace final (IMPORTANT) pour éviter que le contenu ne soit masqué par le FloatingActionButton.
            const SizedBox(height: 100),
          ],
        ),
      ),
      
      // AJOUT DU FLOATING ACTION BUTTON
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pink[700], 
        // Fonction appelée au clic (Navigation)
        onPressed: () => _navigateToEditorManagement(context), 
        // Widget affiché sur le bouton (Icone + Texte)
        label: const Text(
          'Gérer Rédacteurs', 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(
          Icons.settings, // Icône suggérée pour l'administration
          color: Colors.white,
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------
// 4. Classe PartieTitre (Titre et Sous-titre)
// ----------------------------------------------------------------
class PartieTitre extends StatelessWidget {
  const PartieTitre({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          // Titre principal
          Text(
            'Bienvenue au Magazine Infos',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 5),
          // Sous-titre
          Text(
            'Votre magazine numérique, votre source d\'inspiration',
            style: TextStyle(
              fontSize: 16,
              color: Colors.pink,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------
// 5. Classe PartieTexte (Description du magazine)
// ----------------------------------------------------------------
class PartieTexte extends StatelessWidget {
  const PartieTexte({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: const Text(
        // Texte long conforme à la Figure 1
        'Magazine Infos est bien plus qu\'un simple magazine d\'informations. C\'est votre passerelle vers le monde, une source inestimable de connaissances et d\'actualités soigneusement sélectionnées pour vous éclairer sur les enjeux mondiaux, la culture, la science, la, et voir même le divertissement (le jeux).',
        style: TextStyle(
          fontSize: 15,
          color: Colors.black54,
          height: 1.4, // Interligne pour meilleure lecture
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}


// ----------------------------------------------------------------
// 6. Classe PartieIcones 
// ----------------------------------------------------------------
class PartieIcones extends StatelessWidget {
  const PartieIcones({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Padding pour centrer visuellement les icônes
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        // Aligner les éléments uniformément
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _IconeBouton(
            icon: Icons.call, 
            label: 'TEL', 
            onTap: () => _showSnackBar(context, 'Appel simulé'),
          ),
          _IconeBouton(
            icon: Icons.mail_outline, 
            label: 'MAIL', 
            onTap: () => _showSnackBar(context, 'Envoi d\'email simulé'),
          ),
          _IconeBouton(
            icon: Icons.share, 
            label: 'PARTAGE', 
            onTap: () => _showSnackBar(context, 'Partage simulé'),
          ),
        ],
      ),
    );
  }
  
  // Fonction utilitaire pour afficher des messages
  void _showSnackBar(BuildContext context, String message) {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

// Widget utilitaire pour les icônes cliquables
class _IconeBouton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _IconeBouton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 28, color: Colors.pink[700]),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.pink[700],
            ),
          ),
        ],
      ),
    );
  }
}


// ----------------------------------------------------------------
// 7. Classe PartieRubrique (Deux images côte à côte)
// ----------------------------------------------------------------
class PartieRubrique extends StatelessWidget {
  const PartieRubrique({super.key});

  @override
  Widget build(BuildContext context) {
    // Calcule la largeur pour que les images occupent la moitié de l'espace disponible
    final itemWidth = (MediaQuery.of(context).size.width - 40 - 15) / 2;
    
    return Container(
      // Espacement horizontal de 20 pixels demandé
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        // Aligne les éléments avec un espace entre eux
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          // ClipRRect 1 
          ClipRRect(
            // Bordure arrondie
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              'asset/images/image1.jpg', 
              width: itemWidth, // Utilise la largeur calculée
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _PlaceholderImage(
                text: 'Presse',
                width: itemWidth,
              ),
            ),
          ),
          
          // ClipRRect 2 
          ClipRRect(
            // Bordure arrondie
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              'asset/images/image2.jpg', 
              width: itemWidth, // Utilise la largeur calculée
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _PlaceholderImage(
                text: 'Mode',
                width: itemWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Widget utilitaire pour afficher un placeholder si l'image n'est pas trouvée
class _PlaceholderImage extends StatelessWidget {
  final String text;
  final double width;
  const _PlaceholderImage({required this.text, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Center(
        child: Text(
          '$text (Placeholder)',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
    );
  }
}