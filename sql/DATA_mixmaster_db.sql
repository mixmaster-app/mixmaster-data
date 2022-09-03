INSERT INTO `character_type` (`id`, `name`, `img_url`) VALUES
	(1, 'Ditt', NULL),
	(2, 'Jin', NULL),
	(3, 'Penril', NULL),
	(4, 'Phoy', NULL);

INSERT INTO `hench_gender` (`id`, `name`) VALUES
	(1, 'male'),
	(2, 'female');

INSERT INTO `hench_type` (`id`, `name`, `weakness_type_id`) VALUES
	(1, 'Dragon', 6),
	(2, 'Démon', 7),
	(3, 'Bête', 1),
	(4, 'Oiseau', 2),
	(5, 'Insecte', 3),
	(6, 'Plante', 4),
	(7, 'Mystère', 8),
	(8, 'Métal', 5);

INSERT INTO `item` (`id`, `name`, `description`, `item_category_id`) VALUES
	(1, 'ECAILLE DE DRAGON', NULL, 1),
	(2, 'AILE DE CHAUVE-SOURIS', NULL, 1),
	(3, 'DENT AIGUISÉE', NULL, 1),
	(4, 'COLONNE DE VENT', NULL, 1),
	(5, 'DOUCE SÈVE', NULL, 1),
	(6, 'AILE DE VIE', NULL, 1),
	(7, 'BAGUETTE MAGIQUE MYSTIQUE', NULL, 1),
	(8, 'MÉTAL ROUGE', NULL, 1),
	(9, 'BIJOU DE DRAGON', NULL, 1),
	(10, 'CONTRAT DÉMONIAQUE', NULL, 1),
	(11, 'SYMBOLE ANIMAL', NULL, 1),
	(12, 'VENT DE CRISTAL', NULL, 1),
	(13, 'CARAPACE ARC-EN-CIEL', NULL, 1),
	(14, 'FEUILLE DE VIE', NULL, 1),
	(15, 'CRISTAL DU CHAOS', NULL, 1),
	(16, 'CLÉ DE LA MACHINE DE VIE', NULL, 1),
	(17, 'SANG DE DRAGON', NULL, 1),
	(18, 'TOUCHER DÉMONIAQUE', NULL, 1),
	(19, 'COEUR VIGOUREUX', NULL, 1),
	(20, 'PLUME DE FEU', NULL, 1),
	(21, 'AMBRE DE CRISTAL MILLÉNAIRE', NULL, 1),
	(22, 'GRAINE DE L\'ARBRE DE VIE', NULL, 1),
	(23, 'TOURBILLON DE RÊVE', NULL, 1),
	(24, 'BIJOU EN MITHRIL', NULL, 1),
	(25, 'ITEM NIVEAU 4 DRAGON', NULL, 1),
	(26, 'ITEM NIVEAU 4 DÉMON', NULL, 1),
	(27, 'ITEM NIVEAU 4 BÊTE', NULL, 1),
	(28, 'ITEM NIVEAU 4 OISEAU', NULL, 1),
	(29, 'ITEM NIVEAU 4 INSECTE', NULL, 1),
	(30, 'ITEM NIVEAU 4 PLANTE', NULL, 1),
	(31, 'ITEM NIVEAU 4 MYSTÈRE', NULL, 1),
	(32, 'ITEM NIVEAU 4 MÉTAL', NULL, 1),
	(33, 'DRAGON FLAMBOYANT', NULL, 1),
	(34, 'LIVRE MAGIQUE DES TÉNÈBRES', NULL, 1),
	(35, 'CORNE DE LICORNE', NULL, 1),
	(36, 'AILE D\'ANGE', NULL, 1),
	(37, 'INSECTE FOSSILISÉ', NULL, 1),
	(38, 'FLEUR DE VIE', NULL, 1),
	(39, 'AME DU TRÉSOR', NULL, 1),
	(40, 'CŒUR FORT', NULL, 1);

INSERT INTO `item_category` (`id`, `name`) VALUES
	(1, 'mix'),
	(2, 'craft');
