DROP TABLE IF EXISTS cupcakes;
CREATE TABLE IF NOT EXISTS cupcakes (
    id SERIAL NOT NULL,
    flavor VARCHAR NOT NULL,
    size VARCHAR NOT NULL,
    rating FLOAT NOT NULL,
    image VARCHAR NOT NULL
);
INSERT INTO cupcakes (flavor, size, rating, image)
VALUES (
        'Chocolate',
        'Small',
        4.5,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Vanilla',
        'Medium',
        4.2,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Strawberry',
        'Large',
        4.7,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Red Velvet',
        'Small',
        4.3,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Lemon',
        'Medium',
        4.1,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Blueberry',
        'Large',
        4.6,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Caramel',
        'Small',
        4.4,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Pumpkin Spice',
        'Medium',
        4.2,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Cookies and Cream',
        'Large',
        4.8,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Raspberry',
        'Small',
        4.6,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Mint Chocolate',
        'Medium',
        4.3,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Salted Caramel',
        'Large',
        4.7,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Coffee',
        'Small',
        4.5,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Coconut',
        'Medium',
        4.1,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Peanut Butter',
        'Large',
        4.9,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Almond',
        'Small',
        4.4,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Carrot',
        'Medium',
        4.0,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Pistachio',
        'Large',
        4.6,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Cherry',
        'Small',
        4.7,
        'https://tinyurl.com/demo-cupcake'
    ),
    (
        'Apple Cinnamon',
        'Medium',
        4.3,
        'https://tinyurl.com/demo-cupcake'
    );
SELECT setval(
        ' cupcakes_id_seq ',
        (
            SELECT MAX(id)
            FROM cupcakes
        ) + 1
    );