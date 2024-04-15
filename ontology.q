[QueryItem="example"]
PREFIX : <http://example.org/ontology#Ontology#>
PREFIX ex: <http://example.org/ontology#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?person ?gender 
WHERE {
?person rdf:type ex:Customer .
?person ex:gender ?gender .
}