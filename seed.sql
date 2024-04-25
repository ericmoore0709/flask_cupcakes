DROP TABLE IF EXISTS pets;
CREATE TABLE IF NOT EXISTS pets (
    id SERIAL NOT NULL,
    name VARCHAR NOT NULL,
    species VARCHAR NOT NULL,
    photo_url VARCHAR,
    age INTEGER,
    notes VARCHAR,
    available BOOLEAN NOT NULL,
    PRIMARY KEY (id)
);
INSERT INTO pets (name, species, photo_url, age, notes, available)
VALUES (
        'Max',
        'Dog',
        'https://example.com/max.jpg',
        3,
        'Friendly and playful',
        true
    ),
    (
        'Bella',
        'Cat',
        'https://example.com/bella.jpg',
        2,
        'Loves to cuddle',
        true
    ),
    (
        'Charlie',
        'Dog',
        'https://example.com/charlie.jpg',
        5,
        'Well-behaved and trained',
        true
    ),
    (
        'Lucy',
        'Dog',
        'https://example.com/lucy.jpg',
        1,
        'Energetic and loves walks',
        true
    ),
    (
        'Luna',
        'Cat',
        'https://example.com/luna.jpg',
        4,
        'Likes to explore',
        true
    ),
    (
        'Buddy',
        'Dog',
        'https://example.com/buddy.jpg',
        6,
        'Great with kids',
        true
    ),
    (
        'Daisy',
        'Dog',
        'https://example.com/daisy.jpg',
        2,
        'Enjoys playing fetch',
        true
    ),
    (
        'Milo',
        'Cat',
        'https://example.com/milo.jpg',
        3,
        'Likes to nap in sunbeams',
        true
    ),
    (
        'Bailey',
        'Dog',
        'https://example.com/bailey.jpg',
        4,
        'Gentle and affectionate',
        true
    ),
    (
        'Sophie',
        'Cat',
        'https://example.com/sophie.jpg',
        1,
        'Curious and playful',
        true
    );
UPDATE pets
SET photo_url = 'https://ultra-pet.co.za/wp-content/uploads/2020/08/socialising.jpg'
WHERE id > 0;