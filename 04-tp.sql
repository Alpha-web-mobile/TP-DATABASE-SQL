

USE COMPTA;


SELECT *
FROM article 
ORDER BY designation ASC;


SELECT *
FROM article 
ORDER BY prix DESC;


SELECT *
FROM article 
WHERE designation like 'Boulon%'
ORDER BY prix ASC;

SELECT * 
FROM article
WHERE designation LIKE '%sachet%';


SELECT *
FROM article 
WHERE LOWER(designation) LIKE '%sachet%';


SELECT *
FROM article, fournisseur
WHERE article.ID_FOU=fournisseur.ID
ORDER BY fournisseur.NOM ASC, article.PRIX DESC;


SELECT *
FROM article, fournisseur
WHERE article.ID_FOU=fournisseur.ID AND fournisseur.NOM='Dubois & Fils';

SELECT AVG(prix)
FROM article, fournisseur
WHERE article.ID_FOU=fournisseur.ID AND fournisseur.NOM='Dubois & Fils'
ORDER BY fournisseur.NOM ASC, article.PRIX DESC;


SELECT fournisseur.nom, AVG(prix)
FROM article, fournisseur
WHERE article.ID_FOU=fournisseur.ID
GROUP BY fournisseur.nom;

SELECT * 
FROM bon 
WHERE date_cmde BETWEEN '2019-03-01' AND '2019-04-05 12:00:00';

SELECT DISTINCT bon.NUMERO 
FROM bon, compo, article 
WHERE bon.ID=compo.ID_BON AND compo.ID_ART=article.ID
AND designation like 'Boulon%';

SELECT DISTINCT bon.NUMERO, fournisseur.nom 
FROM bon, compo, article, fournisseur 
WHERE bon.ID=compo.ID_BON AND bon.ID_FOU=fournisseur.ID
AND compo.ID_ART=article.ID
AND designation like 'Boulon%';



select id_bon, sum(qte*prix) 
from bon, compo, article 
where bon.ID=compo.ID_BON and compo.ID_ART=article.ID
GROUP BY id_bon;


select bon.id, sum(qte*prix) 
from bon
LEFT JOIN (compo INNER JOIN article ON compo.ID_ART=article.ID) ON bon.ID=compo.ID_BON 
GROUP BY bon.id;


select bon.id, COALESCE(sum(qte*prix),0) 
from bon
LEFT JOIN (compo INNER JOIN article ON compo.ID_ART=article.ID) ON bon.ID=compo.ID_BON 
GROUP BY bon.id;



SELECT id_bon, sum(qte)
FROM bon, compo, article 
WHERE bon.ID=compo.ID_BON AND compo.ID_ART=article.ID
GROUP BY id_bon;

SELECT id_bon, SUM(qte)
FROM bon, compo, article 
WHERE bon.ID=compo.ID_BON AND compo.ID_ART=article.ID
GROUP BY id_bon 
HAVING SUM(qte)>25;

SELECT sum(qte*prix) 
FROM bon, compo, article 
WHERE bon.ID=compo.ID_BON and compo.ID_ART=article.ID
AND month(date_cmde)=4;