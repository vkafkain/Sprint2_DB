db = db.getSiblingDB('optica');
db.dropDatabase();
db = db.getSiblingDB('optica');

db.createCollection('proveidors');
db.createCollection('clients');

db.proveidors.insert(
    [
        {
            _id: ObjectId("000000000000000000000001"),
            nom: 'Optica Urgell',
            telefon: '977777777',
            fax: '977777443',
            NIF: '12345678A',
            adreça: {
                carrer: 'C/ Urgell',
                numero: '1',
                pis: '1',
                porta: '1',
                ciutat: 'Barcelona',
                codi_postal: '08010',
                pais: 'Espanya'
            }
        },
        {
            _id: ObjectId("000000000000000000000002"),
            nom: 'Optica San Juan',
            telefon: '977233333',
            fax: '977233344',
            NIF: '12345678B',
            adreça: {
                carrer: 'C/ San Juan',
                numero: '3',
                pis: '3',
                porta: '12',
                ciutat: 'Barcelona',
                codi_postal: '08004',
                pais: 'Espanya'
            }
        },
        {
            _id: ObjectId("000000000000000000000003"),
            nom: 'Optica Poble Nou',
            telefon: '983710000',
            fax: '983710001',
            NIF: '12345678C',
            adreça: {
                carrer: 'C/ Poble Nou',
                numero: '5',
                pis: '5',
                porta: '5',
                ciutat: 'Barcelona',
                codi_postal: '08005',
                pais: 'Espanya'
            }
        },
        {
            _id: ObjectId("000000000000000000000004"),
            nom: 'Optica Poble Viell',
            telefon: '983720000',
            fax: '983720001',
            NIF: '12345678D',
            adreça: {
                carrer: 'C/ Poble Viell',
                numero: '7',
                pis: '7',
                porta: '7',
                ciutat: 'Barcelona',
                codi_postal: '08006',
                pais: 'Espanya'
            }
        },
]);
