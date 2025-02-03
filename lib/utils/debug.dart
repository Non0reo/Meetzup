import 'dart:math';

import 'package:arobaze/person.dart';

Person createPerson() {
  return Person(
    name: 'John Doe',
    age: Random().nextInt(100),
    username: 'johndoe',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    pointCount: Random().nextInt(100),
    atributes: Atributes(
      superficial: {
        'Nombre d\'amis': 82,
        'Forme physique': 72,
        'Beauté': 90,
        'Argent': 100,
      },
      factual: {
        'Gentillesse': 18,
        'Honneteté': 12,
        'Enpathie': 5,
        'Respect': 15,
      },
    ),
    images: [
      /* 'assets/images/people/person1/first.png',
      'assets/images/people/person1/second.png', */
      'https://picsum.photos/600/1000',
      'https://picsum.photos/700/1100',
      'https://picsum.photos/800/1200',
    ],
    profilePicture: 'assets/images/people/person1/first.png',
  );
}

Person createSelf() {
  return Person(
    name: 'Florian',
    age: 15,
    username: 'florian92170',
    description: 'Salut ! Je suis Florian et j\'aimerai bien me faire des amis. Je suis assez introverti mais je suis très gentil. N\'hésitez pas à venir me parler !',
    pointCount: 17,
    atributes: Atributes(
      superficial: {
        'Nombre d\'amis': 16,
        'Forme physique': 24,
        'Beauté': 30,
        'Argent': 10,
      },
      factual: {
        'Gentillesse': 83,
        'Honneteté': 88,
        'Enpathie': 95,
        'Respect': 85,
      },
    ),
    images: [
      /* 'assets/images/people/person2/first.png',
      'assets/images/people/person2/second.png', */
      'https://picsum.photos/600/1000',
      'https://picsum.photos/700/1100',
      'https://picsum.photos/800/1200',
    ],
    profilePicture: 'assets/images/people/profile/daniel.png'
  );
}







//The following function
List<Person> getListOfPeople() {
  return [
    Person(
      name: 'Antoine',
      age: 17,
      username: 'antoine.gtr',
      description: "Toujours au top, toujours entouré. Fan de F1, de mode et de soirées et les selfies. Ici pour briller ✨",
      pointCount: 92,
      atributes: Atributes(
        superficial: {
          'Nombre d\'amis': 95,
          'Forme physique': 85,
          'Beauté': 92,
          'Argent': 98,
        },
        factual: {
          'Gentillesse': 20,
          'Honnêteté': 18,
          'Empathie': 10,
          'Respect': 15,
        },
      ),
      images: ['assets/images/people/person1/first.png', 'assets/images/people/person1/second.png'],
      profilePicture: 'assets/images/people/person1/first.png',
    ),
    Person(
      name: 'Chloé',
      age: Random().nextInt(4) + 15,
      username: 'chloe_star',
      description: "J'ai fait tombé ça 👑\nJe vis ma meilleure vie. Tu veux suivre le rythme ? 💃",
      pointCount: 87,
      atributes: Atributes(
        superficial: {
          'Nombre d\'amis': 88,
          'Forme physique': 78,
          'Beauté': 95,
          'Argent': 90,
        },
        factual: {
          'Gentillesse': 15,
          'Honnêteté': 12,
          'Empathie': 8,
          'Respect': 14,
        },
      ),
      images: ['assets/images/people/person2/first.jpg', 'assets/images/people/person2/second.jpg'],
      profilePicture: 'assets/images/people/person2/first.jpg',
    ),
    Person(
      name: 'Jules',
      age: Random().nextInt(4) + 15,
      username: 'jules92170',
      description: "Je suis fan de bouquins et de code. Je suis un peu réservé, mais toujours là pour discuter de trucs cools ! 📚",
      pointCount: Random().nextInt(10) + 40,
      atributes: Atributes(
        superficial: {
          'Nombre d\'amis': 40,
          'Forme physique': 50,
          'Beauté': 42,
          'Argent': 45,
        },
        factual: {
          'Gentillesse': 90,
          'Honnêteté': 85,
          'Empathie': 92,
          'Respect': 88,
        },
      ),
      images: ['assets/images/people/person3/first.jpg', 'assets/images/people/person3/second.jpg', 'assets/images/people/person3/third.jpg'],
      profilePicture: 'assets/images/people/person3/first.jpg',
    ),
    Person(
      name: 'Léo',
      age: Random().nextInt(4) + 15,
      username: 'leool_athe',
      description: "Escalade, volley, et encore du sport    ig: @leool_athe",
      pointCount: Random().nextInt(10) + 80,
      atributes: Atributes(
        superficial: {
          'Nombre d\'amis': 90,
          'Forme physique': 95,
          'Beauté': 88,
          'Argent': 85,
        },
        factual: {
          'Gentillesse': 18,
          'Honnêteté': 14,
          'Empathie': 10,
          'Respect': 13,
        },
      ),
      images: ['assets/images/people/person4/first.jpg', 'assets/images/people/person4/second.jpg', 'assets/images/people/person4/third.jpg'],
      profilePicture: 'assets/images/people/person4/first.jpg',
    ),
    Person(
      name: 'Camille',
      age: Random().nextInt(4) + 15,
      username: 'camill.art',
      description: "Team chill et créativité ✏️ J’adore dessiner, écrire et refaire le monde autour d’un bon café ☕",
      pointCount: Random().nextInt(10) + 40,
      atributes: Atributes(
        superficial: {
          'Nombre d\'amis': 35,
          'Forme physique': 45,
          'Beauté': 32,
          'Argent': 40,
        },
        factual: {
          'Gentillesse': 95,
          'Honnêteté': 90,
          'Empathie': 96,
          'Respect': 92,
        },
      ),
      images: ['assets/images/people/person5/first.jpg', 'assets/images/people/person5/second.jpg'],
      profilePicture: 'assets/images/people/person5/profile.jpg',
    ),
    Person(
      name: 'Lucas',
      age: Random().nextInt(4) + 15,
      username: 'lucastruc',
      description: "Je suis beau et j'adore l'argent",
      pointCount: Random().nextInt(10) + 76,
      atributes: Atributes(
        superficial: {
          'Nombre d\'amis': 79,
          'Forme physique': 83,
          'Beauté': 70,
          'Argent': 98,
        },
        factual: {
          'Gentillesse': 20,
          'Honnêteté': 14,
          'Empathie': 23,
          'Respect': 25,
        },
      ),
      images: ['assets/images/people/person6/first.jpg', 'assets/images/people/person6/second.jpg', 'assets/images/people/person6/third.jpg', 'assets/images/people/person6/fourth.jpg'],
      profilePicture: 'assets/images/people/person6/profile.jpg',
    ),
  ];

}