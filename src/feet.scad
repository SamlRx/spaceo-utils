// --- Paramètres ---

// Tige cylindrique
trou_diametre = 3.8;
trou_profondeur = 10;
jeu = 0.1;
diametre_tige = trou_diametre - jeu;
longueur_tige = trou_profondeur;

// Biseau
hauteur_biseau = 2;
diametre_biseau_base = diametre_tige - 0.6;  // Légèrement plus large pour bien guider

// Butée rectangulaire
largeur_butee = 14;
longueur_butee = 30;
hauteur_butee = 1.6;

// --- Modèle ---
module pied() {
    union() {
        // Biseau en bas
        cylinder(h = hauteur_biseau, d1 = diametre_biseau_base, d2 = diametre_tige, $fn = 100);

        // Tige au-dessus du biseau
        translate([0, 0, hauteur_biseau])
            cylinder(h = longueur_tige - hauteur_biseau, d = diametre_tige, $fn = 100);

        // Butée rectangulaire en haut
        translate([-largeur_butee/2, -longueur_butee/2, longueur_tige])
            cube([largeur_butee, longueur_butee, hauteur_butee]);
    }
}

// Appel du module
pied();
