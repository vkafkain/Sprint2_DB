db = db.getSiblingDB('optica');
db.dropDatabase();
db = db.getSiblingDB('optica');

db.createCollection('proveidors', {
    validator: {
        $jsonSchema: {
            aditionalProperties: false,
            bsonType: "object",
            required: ["nom", "telefon", "fax", "NIF", "adreça"],
            properties: {
                nom: {bsonType: "string"},
                telefon: {bsonType: "string"},
                fax: {bsonType: "string"},
                NIF: {bsonType: "string"},
                adreça: {
                    bsonType: "object",
                    required: ["carrer", "numero", "pis", "porta", "ciutat", "codi_postal, pais"],
                    properties: {
                        carrer: {bsonType: "string"},
                        numero: {bsonType: "string"},
                        pis: {bsonType: "string"},
                        porta: {bsonType: "string"},
                        ciutat: {bsonType: "string"},
                        codi_postal: {bsonType: "string"},
                        pais: {bsonType: "string"}
                    }
                }
            }
        }
    }
});