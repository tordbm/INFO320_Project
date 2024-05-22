[QueryItem="storeLocations"]
PREFIX : <http://example.org/ontology#>
PREFIX ex: <http://example.org/ontology#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?store ?lat ?long ?address ?storeType
          WHERE {
                  ?store rdf:type :SalesOutlet;
                      :store_latitude ?lat;
                      :store_longitude ?long;
                      :store_address ?address;
                      :store_type ?storeType .
              }
[QueryItem="customerData"]
PREFIX : <http://example.org/ontology#>
PREFIX ex: <http://example.org/ontology#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?loyalty ?email ?name (SUM(?quantity) AS ?total_quantity)
            WHERE {
              ?reciept a :Reciept;
                      :customerAppearsOn ?customer;
                      :quantity ?quantity .
              
              ?customer a :Customer;
                :customer_first_name ?name;
                :loyalty_card_number ?loyalty;
                :customer_email ?email .
              
            }
            GROUP BY ?name ?loyalty ?email
            ORDER BY DESC (?total_quantity)
            LIMIT 100
[QueryItem="pastriesSold"]
PREFIX : <http://example.org/ontology#>
PREFIX ex: <http://example.org/ontology#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?quantitySold ?transactionDate ?salesOutletId ?productId ?productName
            WHERE {
              ?pastryInventory rdf:type :PastryInventory;
                              :transaction_date ?transactionDate;
                              :quantity_sold ?quantitySold;
                              :sales_outlet_id ?salesOutletId;
                              :productPartOf ?productId .
              
              ?productId :product ?productName .
}
[QueryItem="beveragesSold"]
PREFIX : <http://example.org/ontology#>
PREFIX ex: <http://example.org/ontology#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>


SELECT ?quantitySold ?transactionDate ?salesOutletId ?productId ?productType
            WHERE {
              ?reciept rdf:type :Reciept;
                              :transaction_date ?transactionDate;
                              :quantity ?quantitySold;
                              :salesOutletAppearsOn ?salesOutletId;
                              :productAppearsOn ?productId .
              
              ?productId :product_type ?productType .

              }
              ORDER BY ?transactionDate