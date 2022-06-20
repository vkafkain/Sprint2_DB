db = db.getSiblingDB('youtube');
db.dropDatabase();
db = db.getSiblingDB('youtube');

db.createCollection('usuari');

db.usuari.insert(
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
                }
            ]
            }
        }
    ]
);
