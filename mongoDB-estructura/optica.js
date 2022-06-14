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

db.clients.insert(
    [
        {
            _id: ObjectId("000000000000000000000001"),
            nom: 'Antoni Lopez',
            codi_postal: '08010',
            telefon: '977771233',
            correu_electronic: 'antoni.lopez@gmail.com',
            data_registre: '2017-01-01',
            client_recomanat: false,
            ulleres:
            {
                marca: 'Sunglasses',
                graduacio: {
                    vidre_dret: {
                        graducacio: 0.34,
                        color: 'blau'
                    },
                    vidre_esquerra: {
                        graducacio: 0.31,
                        color: 'blau'
                    }
                },
                muntura:  ['flotant'],
                color_muntura: 'groc',
                preu: 200,
                empleat_venta:{
                    nom: 'Antoni Lopez',
                },
                proveidor: {
                    $ref: 'proveidors',
                    $id: ObjectId("000000000000000000000001")
                }
            }
        },
        {
            _id: ObjectId("000000000000000000000002"),
            nom: 'Juan Perez',
            codi_postal: '08012',
            telefon: '97712314',
            correu_electronic: 'juanperes@is.com',
            data_registre: '2021-02-10',
            client_recomanat:{
                $id: ObjectId("000000000000000000000001"),
                $ref: 'clients'
            },
            ulleres:
            {
                marca: 'Rayban',
                graduacio: {
                    vidre_dret: {
                        graducacio: 0.1,
                        color: 'transparent'
                    },
                    vidre_esquerra: {
                        graduacio: 0.4,
                        color: 'transparent'
                    }
                },
                muntura:  ['pasta'],
                color_muntura: 'negre',
                preu: 300,
                empleat_venta:{
                    nom: 'Antoni Lopez',
                },
                proveidor: {
                    $ref: 'proveidors',
                    $id: ObjectId("000000000000000000000002")
                }
            }
        },
        {
            _id: ObjectId("000000000000000000000003"),
            nom: 'Maria Ortega',
            codi_postal: '08013',
            telefon: '97123314',
            correu_electronic: 'maria@ise.com',
            data_registre: '2018-10-10',
            client_recomanat: {
                $id: ObjectId("000000000000000000000002"),
                $ref: 'clients'
            },
            ulleres:
            {
                marca: 'Tag Heuer',
                graduacio: {
                    vidre_dret: {
                        graducacio: 1.1,
                        color: 'negre',
                    },
                    vidre_esquerra: {
                        graducacio: 1.3,
                        color: 'negre',
                    }
                },
                muntura:  ['metal·lica'],
                color_muntura: 'gris',
                preu: 400,
                empleat_venta:{
                    nom: 'Carme Trullas',
                },
                proveidor: {
                    $ref: 'proveidors',
                    $id: ObjectId("000000000000000000000003")
                }
            }
        },
        {
            _id: ObjectId("000000000000000000000004"),
            nom: 'Rosa Perez',
            codi_postal: '08014',
            telefon: '977098875',
            correu_electronic: 'perezrosa@gmail.com',
            data_registre: '2017-12-12',
            client_recomanat: {
                $id: ObjectId("000000000000000000000003"),
                $ref: 'clients'
            },
            ulleres:
            {
                marca: 'Oakley',
                graduacio: {
                    vidre_dret: {
                        graducacio: 0.23,
                        color: 'transparent',
                    },
                    vidre_esquerra: {
                        graducacio: 0.12,
                        color: 'transparent',
                    }
                },
                muntura:  ['metal·lica'],
                color_muntura: 'blanc',
                preu: 1500,
                empleat_venta:{
                    nom: 'Mireia Lopez',
                },
                proveidor: {
                    $ref: 'proveidors',
                    $id: ObjectId("000000000000000000000004")
                }
            }
        }
    ]
);

