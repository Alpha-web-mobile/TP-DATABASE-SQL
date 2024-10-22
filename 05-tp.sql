
USE COMPTA;

UPDATE article
SET designation = lower(designation)
WHERE id = 2;


UPDATE article
SET designation = upper(designation)
WHERE prix > 10;

UPDATE article
SET prix = prix * 0.9
WHERE id NOT IN (
    SELECT distinct id_art
    FROM compo
);


UPDATE compo
SET qte = qte * 2
WHERE id_bon IN (
    SELECT bon.id
    FROM bon, fournisseur
    WHERE bon.id_fou = fournisseur.id
    AND nom = 'Française d''Imports'
);
