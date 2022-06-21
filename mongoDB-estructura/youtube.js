db = db.getSiblingDB('youtube');
db.dropDatabase();
db = db.getSiblingDB('youtube');

db.createCollection('usuaris');

db.usuaris.insert(
    [
        {
            _id: ObjectId('000000000000000000000001'),
            email: 'delapaz@gmail.com',
            password: '123456',
            nom:'Juan Montaner de la Paz',
            data_naixement: '12/12/1990',
            sexe: 'home',
            pais: 'Colombia',
            codi_postal: '12345',
            canal: {
                _id: ObjectId('000000000000000000000001'),
                nom: 'Canal de juan',
                descripcio: 'Canal de juan',
                data_creacio: '08/12/2020',
                videos: [
                    {
                        _id: ObjectId('000000000000000000000001'),
                        titol: 'Vacances',
                        descripcio: 'Vacances',
                        tamany: '890MB',
                        nom_arxiu: 'vacances.mp4',
                        durara: '1:30',
                        thumbnail: 'vacances.jpg',
                        reproduccions: 5,
                        likes: 5,
                        dislikes: 0,
                        estat: 'public',
                        etiquetes: [
                            {
                            _id: ObjectId('000000000000000000000001'),
                            nom: 'vacances',
                        },
                        {
                            _id: ObjectId('000000000000000000000002'),
                            nom: 'familia'
                        },
                        {
                            _id: ObjectId('000000000000000000000003'),
                            nom: 'llacuna'
                        }
                    ],
                        comentaris: [
                        {
                            _id: ObjectId('000000000000000000000001'),
                            text: 'Molt bon video',
                            data: '08/10/2021',
                            hora: '16:23',
                            likes: [
                                {
                                    usuari: {
                                        $ref: 'usuaris',
                                        $id: ObjectId('000000000000000000000001'),
                                        data: '08/10/2021',
                                        hora: '16:23'
                                    }
                                }
                            ],
                            dislikes: [
                                {
                                    usuari: {
                                        $ref: 'usuaris',
                                        $id: ObjectId('000000000000000000000003'),
                                        data: '18/12/2021', 
                                        hora: '20:33'
                                    }
                                }
                            ]
                            },
                        {
                            _id: ObjectId('000000000000000000000002'),
                            text: 'Interessant, espero que no triguis molt a publicar',
                            data: '12/01/2021',
                            hora: '22:54',
                        },
                    ],
                        suscriptors: [
                            {
                                $ref:'usuaris',
                                $id: ObjectId('000000000000000000000001'),
                            },
                            {
                                $ref:'usuaris',
                                $id: ObjectId('000000000000000000000002'),
                            },
                        ],
                        likes: [
                            {
                                usuari: {
                                    $ref: 'usuaris',
                                    $id: ObjectId('000000000000000000000003'),
                                    data: '18/12/2021',
                                    hora: '20:33'
                                }
                            }
                        ],
                        dislikes: [
                            {
                                usuari: {
                                    $ref: 'usuaris',
                                    $id: ObjectId('000000000000000000000001'),
                                    data: '08/10/2021',
                                    hora: '16:23'
                                }
                            }
                        ],
                        
                    },
                ],
            },
            playlists: [
                {
                    _id: ObjectId('000000000000000000000001'),
                    nom: 'La meva playlist',
                    data: '28/03/2021',
                    estat: 'public',
                },
            ],
        },
        {
            _id: ObjectId('000000000000000000000002'),
            email: 'josefinalondon@hotmail.com',
            password: '123456',
            nom:'Jose Fina London Triguero',
            data_naixement: '12/12/1990',
            sexe: 'dona',
            pais: 'Argentina',
            codi_postal: '12345',
            canal: {
                _id: ObjectId('000000000000000000000002'),
                nom: 'Josefinax',
                descripcio: 'Recetas y más',
                data_creacio: '19/03/2019',
                videos: [
                    {
                        _id: ObjectId('000000000000000000000002'),
                        titol: 'Pollo a la plancha',
                        descripcio: 'Pollo a la plancha',
                        tamany: '890MB',
                        nom_arxiu: 'pollo.mp4',
                        durara: '1:30',
                        thumbnail: 'pollo.jpg',
                        reproduccions: 5,
                        likes: 5,
                        dislikes: 0,
                        estat: 'public',
                        etiquetes: [
                            {
                            _id: ObjectId('000000000000000000000002'),
                            nom: 'pollo',
                        },
                        {
                            _id: ObjectId('000000000000000000000003'),
                            nom: 'recetas'
                        },
                        {
                            _id: ObjectId('000000000000000000000004'),
                            nom: 'cocina'
                        }
                    ],
                        comentaris: [
                        {
                            _id: ObjectId('000000000000000000000002'),
                            text: 'Molt bon video',
                            data: '08/10/2021',
                            hora: '16:23',
                            likes: [
                                {
                                    usuari: {
                                        $ref: 'usuaris',
                                        $id: ObjectId('000000000000000000000001'),
                                        data: '08/10/2020',
                                        hora: '19:00'
                                    }
                                }
                            ],
                            dislikes: [
                                {
                                    usuari: {
                                        $ref: 'usuaris',
                                        $id: ObjectId('000000000000000000000003'),
                                        data: '08/03/2019',
                                        hora: '20:10'
                                    }
                                }
                            ]
                            },
                        {
                            _id: ObjectId('000000000000000000000003'),
                            text: 'Interessant, espero que no triguis molt a publicar',
                            data: '12/01/2021',
                            hora: '22:54',
                        },
                    ],
                        suscriptors: [
                            {
                                $ref:'usuaris',
                                $id: ObjectId('000000000000000000000001'),
                            },
                            {
                                $ref:'usuaris',
                                $id: ObjectId('000000000000000000000002'),
                            },
                        ],
                        likes: [
                            {
                                usuari: {
                                    $ref: 'usuaris',
                                    $id: ObjectId('000000000000000000000001'),
                                    data: '08/10/2020',
                                    hora: '19:00'
                                }
                            }
                        ],
                        dislikes: [
                            {
                                usuari: {
                                    $ref: 'usuaris',
                                    $id: ObjectId('000000000000000000000003'),
                                    data: '08/03/2019',
                                    hora: '20:10'
                                }
                            }
                        ],

                    },
                ],
            },
            playlists: [
                {
                    _id: ObjectId('000000000000000000000001'),
                    nom: 'La meva playlist',
                    data: '28/03/2021',
                    estat: 'public',
                },
            ],
        },
        {   
            _id: ObjectId('000000000000000000000003'),
            email: 'georginablanc@yahoo.es',
            password: '123456',
            nom:'Georgina Blanc Espunya',
            data_naixement: '12/12/1990',
            sexe: 'dona',
            pais: 'Espanya',
            codi_postal: '12345',
            canal: {
                _id: ObjectId('000000000000000000000003'),
                nom: 'Georginax',
                descripcio: 'Recetas y más',
                data_creacio: '19/03/2019',
                videos: [
                    {
                        _id: ObjectId('000000000000000000000003'),
                        titol: 'Portugal',
                        descripcio: 'Viatges a Portugal',
                        tamany: '890MB',
                        nom_arxiu: 'portugal.mp4',
                        durara: '1:30',
                        thumbnail: 'portugal.jpg',
                        reproduccions: 5,
                        likes: 5,
                        dislikes: 0,
                        estat: 'public',
                        etiquetes: [
                            {
                            _id: ObjectId('000000000000000000000003'),
                            nom: 'portugal',
                        },
                        {
                            _id: ObjectId('000000000000000000000004'),
                            nom: 'viatges'
                        },
                        {
                            _id: ObjectId('000000000000000000000005'),
                            nom: 'descubrir'
                        }
                ],
                        comentaris: [
                        {   
                            _id: ObjectId('000000000000000000000003'),
                            text: 'Que viaje más bonito',
                            data: '18/12/2021',
                            hora: '16:23',
                            likes: [
                                {
                                    usuari: {
                                        $ref: 'usuaris',
                                        $id: ObjectId('000000000000000000000001'),
                                        data: '27/12/2021',
                                        hora: '19:00'
                                    }
                                }
                            ],
                            dislikes: [
                                {
                                    usuari: {
                                        $ref: 'usuaris',
                                        $id: ObjectId('000000000000000000000003'),
                                        data: '18/03/2019',
                                        hora: '20:10'
                                    }
                                }
                            ]
                            },
                        {
                            _id: ObjectId('000000000000000000000004'),
                            text: 'Interessant, espero que no triguis molt a publicar',
                            data: '12/01/2021',
                            hora: '22:54',
                        },
                    ],
                        suscriptors: [
                            {
                                $ref:'usuaris',
                                $id: ObjectId('000000000000000000000001'),
                            },
                            {
                                $ref:'usuaris',
                                $id: ObjectId('000000000000000000000002'),
                            },
                        ],
                        likes: [
                            {
                                usuari: {
                                    $ref: 'usuaris',
                                    $id: ObjectId('000000000000000000000001'),
                                    data: '19/03/2020',
                                    hora: '19:52'
                                }
                            }
                        ],
                        dislikes: [
                            {
                                usuari: {
                                    $ref: 'usuaris',
                                    $id: ObjectId('000000000000000000000003'),
                                    data: '08/03/2019',
                                    hora: '20:10'
                                }
                            }
                        ],
                    },
                ],
            },
            playlists: [
                {
                    _id: ObjectId('000000000000000000000001'),
                    nom: 'La meva playlist',
                    data: '28/03/2021',
                    estat: 'public',
                },
            ],
        },
        {
            _id: ObjectId('000000000000000000000004'),
            email: 'antuanromeva@thx.com',
            password: 'antuan123456',
            nom:'Antuan Romeva Castelló',
            data_naixement: '23/12/1982',
            sexe: 'home',
            pais: 'Espanya',
            codi_postal: '18982',
            canal: {
                _id: ObjectId('000000000000000000000004'),
                nom: 'Romeva Games',
                descripcio: 'Juegos y más',
                data_creacio: '19/03/2019',
                videos: [
                    {
                        _id: ObjectId('000000000000000000000004'),
                        titol: 'Las piramides en minecraft',
                        descripcio: 'Juego de piramides',
                        tamany: '890MB',
                        nom_arxiu: 'piramides.mp4',
                        durara: '1:30',
                        thumbnail: 'piramides.jpg',
                        reproduccions: 5,
                        likes: 5,
                        dislikes: 0,
                        estat: 'public',
                        etiquetes: [
                            {
                            _id: ObjectId('000000000000000000000004'),
                            nom: 'minecraft'
                        },
                        {
                            _id: ObjectId('000000000000000000000005'),
                            nom: 'juegos'
                        },
                        {
                            _id: ObjectId('000000000000000000000006'),
                            nom: 'mojan'
                        }
                ],
                        comentaris: [
                        {
                            _id: ObjectId('000000000000000000000004'),
                            text: 'Que juego más bonito',
                            data: '18/12/2021',
                            hora: '16:23',
                            likes: [
                                {
                                    usuari: {
                                        $ref: 'usuaris',
                                        $id: ObjectId('000000000000000000000001'),
                                        data: '27/12/2021',
                                        hora: '19:00'
                                    }
                                }
                            ],
                            dislikes: [
                                {
                                    usuari: {
                                        $ref: 'usuaris',
                                        $id: ObjectId('000000000000000000000003'),
                                        data: '18/03/2019',
                                        hora: '20:10'
                                    }
                                }
                            ]
                            },
                        {
                            _id: ObjectId('000000000000000000000005'),
                            text: 'Gracias por el tutorial para crear piramides',
                            data: '12/01/2021',
                            hora: '22:54',
                        },
                    ],
                        suscriptors: [
                            {
                                $ref:'usuaris',
                                $id: ObjectId('000000000000000000000003'),
                            },
                            {
                                $ref:'usuaris',
                                $id: ObjectId('000000000000000000000004'),
                            },
                        ],
                        likes: [
                            {
                                usuari: {
                                    $ref: 'usuaris',
                                    $id: ObjectId('000000000000000000000001'),
                                    data: '11/11/2021',
                                    hora: '19:52'
                                }
                            }
                        ],
                        dislikes: [
                            {
                                usuari: {
                                    $ref: 'usuaris',
                                    $id: ObjectId('000000000000000000000003'),
                                    data: '18/08/2021',
                                    hora: '22:10'
                                }
                            }
                        ],
                    },
                ],
            },
            playlists: [
                {
                    _id: ObjectId('000000000000000000000001'),
                    nom: 'Videojocs i més',
                    data: '28/03/2021',
                    estat: 'public',
                },
            ],
        },
    ]
);
