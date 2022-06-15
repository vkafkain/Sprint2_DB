db = db.getSiblingDB('pizzeria');
db.dropDatabase();
db = db.getSiblingDB('pizzeria');

db.createCollection('clients');
db.createCollection('productes');
db.createCollection('botigues');

db.clients.insert(
    [
        {
            _id: ObjectId("000000000000000000000001"),
            nom: 'Juan',
            cognoms:'Perez Perez',
            adreça: {
                carrer: 'C/ Juan',
                numero: '1',
                pis: '4',
                porta: '62',
                codi_postal: '08010',
                localitat: {
                    nom: 'Barcelona',
                    provincia: {
                        nom: 'Barcelona',
                    }
                }
            }
        },
        {
            _id: ObjectId("000000000000000000000002"),
            nom: 'Maria',
            cognoms:'Piug Puyol',
            adreça: {
                carrer: 'C/ Taipoles',
                numero: '121',
                pis: '4',
                porta: '62',
                codi_postal: '08010',
                localitat: {
                    nom: 'Tarragona',
                    provincia: {
                        nom: 'Tarragona',
                    }
                }
            }
        },
        {
            _id: ObjectId("000000000000000000000003"),
            nom: 'Josep',
            cognoms:'Montanyes Barba',
            adreça: {
                carrer: 'C/ Florian',
                numero: '23',
                pis: '4',
                porta: '62',
                codi_postal: '08233',
                localitat: {
                    nom: 'Santa Coloma de Gramenet',
                    provincia: {
                        nom: 'Barcelona',
                    }
                }
            }
        },
        {
            _id: ObjectId("000000000000000000000004"),
            nom: 'Jordi',
            cognoms:'Garcia Almansa',
            adreça: {
                carrer: 'C/ Ribes',
                numero: '23',
                pis: '4',
                porta: '62',
                codi_postal: '08001',
                localitat: {
                    nom: 'Sant Boi de Llobregat',
                    provincia: {
                        nom: 'Barcelona',
                    }
                }
            }
        }
    ]
);

db.productes.insert(
    [
        {
            _id: ObjectId("000000000000000000000001"),
            tipus_producte:['pizza', 'hamburguesa', 'beguda'],
            default:'pizza',
            nom: 'Quatre formatges',
            drescripcio: 'Pizza de quatre formatges',
            imatge: 'http://www.pizzeria.com/pizza_quatre_formatges.jpg',
            preu: 12,
            categoria: {
                nom: 'Basica',
            }
        },
        {
            _id: ObjectId("000000000000000000000002"),
            tipus_producte:['pizza', 'hamburguesa', 'beguda'],
            default:'pizza',
            nom: 'Marinara',
            drescripcio: 'Pizza de marinara amb tomaquet i all',
            imatge: 'http://www.pizzeria.com/pizza_marinara.jpg',
            preu: 10,
            categoria: {
                nom: 'Basica',
            }
        },
        {
            _id: ObjectId("000000000000000000000003"),
            tipus_producte:['pizza', 'hamburguesa', 'beguda'],
            default:'pizza',
            nom: 'Calzone',
            drescripcio: 'Pizza de calzone amb tomaquet i pernil',
            imatge: 'http://www.pizzeria.com/pizza_calzone.jpg',
            preu: 16,
            categoria: {
                nom: 'Especial',
            }
        },
        {
            _id: ObjectId("000000000000000000000004"),
            tipus_producte:['pizza', 'hamburguesa', 'beguda'],
            default:'pizza',
            nom: 'Extra Picant',
            drescripcio: 'Pizza especial amb extra picant',
            imatge: 'http://www.pizzeria.com/pizza_extra_picant.jpg',
            preu: 14,
            categoria: {
                nom: 'Pizza del mes',
            }
        },
        {
            _id: ObjectId("000000000000000000000005"),
            tipus_producte:['pizza', 'hamburguesa', 'beguda'],
            default:'hamburguesa',
            nom: 'Chesse Burguer',
            drescripcio: 'Hamburguesa de carn amb formatge',
            imatge: 'http://www.pizzeria.com/hamburguesa_chess_burguer.jpg',
            preu: 11,
        },
        {
            _id: ObjectId("000000000000000000000006"),
            tipus_producte:['pizza', 'hamburguesa', 'beguda'],
            default:'beguda',
            nom: 'Aigua',
            drescripcio: 'Beguda de aigua',
            imatge: 'http://www.pizzeria.com/beguda_aigua.jpg',
            preu: 3,
        },
        {
            _id: ObjectId("000000000000000000000007"),
            tipus_producte:['pizza', 'hamburguesa', 'beguda'],
            default:'beguda',
            nom: 'Coca-Cola',
            drescripcio: 'Beguda de coca-cola',
            imatge: 'http://www.pizzeria.com/beguda_coca_cola.jpg',
            preu: 4,
        },
        {
            _id: ObjectId("000000000000000000000008"),
            tipus_producte:['pizza', 'hamburguesa', 'beguda'],
            default:'beguda',
            nom: 'Lambrusco',
            drescripcio: 'Vi rosat amb gas',
            imatge: 'http://www.pizzeria.com/beguda_lambrusco.jpg',
            preu: 15,
        },
        {
            _id: ObjectId("000000000000000000000009"),
            tipus_producte:['pizza', 'hamburguesa', 'beguda'],
            default:'beguda',
            nom: 'Vichy',
            drescripcio: 'Aigua amb gas',
            imatge: 'http://www.pizzeria.com/beguda_vichy.jpg',
            preu: 5,
        },
        {
            _id: ObjectId("000000000000000000000010"),
            tipus_producte:['pizza', 'hamburguesa', 'beguda'],
            default:'beguda',
            nom: 'Cervesa',
            drescripcio: 'Cervesa artesanal',
            imatge: 'http://www.pizzeria.com/beguda_cervesa.jpg',
            preu: 6,
        },
    ]
);

db.botigues.insert(
    [
        {
            _id: ObjectId("000000000000000000000001"),
            adreça:{
                carrer: 'C/ Florian',
                numero: '23',
                pis: 'Local',
                porta: '1',
                codi_postal: '08233',
                localitat: {
                    nom: 'Santa Coloma de Gramenet',
                    provincia: {
                        nom: 'Barcelona',
                    }
                }
            },
            comandes: [
                {
                    _id: ObjectId("000000000000000000000001"),
                    data: '12/12/2012',
                    hora: '12:00',
                    tipus_comanda: {
                        tipus: ['domicili', 'botiga'],
                        default: 'domicili',
                    },
                    productes_comanda: [{
                        $ref: 'productes',
                        $id: ObjectId("000000000000000000000001"),
                        quantitat: 1,
                    },
                    {
                        $ref: 'productes',
                        $id: ObjectId("000000000000000000000007"),
                        quantitat: 1,
                    }],
                    preu_total: 16,
                }],
            empleats: [
                {
                    _id: ObjectId("000000000000000000000001"),
                    nom: 'Jordi',
                    cognom: 'Garcia Romeu',
                    NIF: '12345678A',
                    telefon: '977794823',
                    lloc_treball: 'cuiner'
            },
                {
                    _id: ObjectId("000000000000000000000002"),
                    nom: 'Xeila',
                    cognom: 'Jonshon de la Calle',
                    NIF: '23443333B',
                    telefon: '971231333',
                    lloc_treball: 'repartidor'
            },
                {
                    _id: ObjectId("000000000000000000000003"),
                    nom: 'Raul',
                    cognom: 'Lopez Vidal',
                    NIF: '12345678C',
                    telefon: '977123333',
                    lloc_treball: 'repartidor'
            },
                {
                    _id: ObjectId("000000000000000000000004"),
                    nom: 'Angela',
                    cognom: 'Moles Alba',
                    NIF: '12345678D',
                    telefon: '912333331',
                    lloc_treball: 'cuiner'
            }],
            _id: ObjectId("000000000000000000000002"),
            adreça:{
                carrer: 'C/ Tarragona',
                numero: '233',
                pis: 'Local',
                porta: '1',
                codi_postal: '18233',
                localitat: {
                    nom: 'Barcelona',
                    provincia: {
                        nom: 'Barcelona',
                    }
                }    
            },
            comandes: [
                {
                    _id: ObjectId("000000000000000000000002"),
                    data: '12/12/2019',
                    hora: '21:20',
                    tipus_comanda: {
                        tipus: ['domicili', 'botiga'],
                        default: 'domicili',
                    },
                    productes_comanda: [{
                        $ref: 'productes',
                        $id: ObjectId("000000000000000000000003"),
                        quantitat: 3,
                    },
                    {
                        $ref: 'productes',
                        $id: ObjectId("000000000000000000000006"),
                        quantitat: 1,
                    }],
                    preu_total: 46,
                }],
            empleats: [
                {
                    _id: ObjectId("000000000000000000000005"),
                    nom: 'Marti',
                    cognom: 'Berasategui Martinez',
                    NIF: '564422222A',
                    telefon: '977712323',
                    lloc_treball: 'cuiner'
            },
                {
                    _id: ObjectId("000000000000000000000006"),
                    nom: 'Maria',
                    cognom: 'Gileyt Navarro',
                    NIF: '564411222B',
                    telefon: '977231333',
                    lloc_treball: 'repartidor'
            },
                {
                    _id: ObjectId("000000000000000000000007"),
                    nom: 'Eli',
                    cognom: 'Molero Andorra',
                    NIF: '564411222C',
                    telefon: '921333122',
                    lloc_treball: 'cuiner'
            },
                {
                    _id: ObjectId("000000000000000000000008"),
                    nom: 'Andreu',
                    cognom: 'Samper Marti',
                    NIF: '564411222D',
                    telefon: '912333331',
                    lloc_treball: 'repartidor'
            }],
        }   
    ]
);