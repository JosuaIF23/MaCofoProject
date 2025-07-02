const express = require('express');
const cors = require('cors');
const app = express();
const port = 3000;

app.use(cors());

const coffees = [
  {
    id: 1,
    title: "Cappuccino",
    description: "A foamy blend of espresso and steamed milk.",
    ingredients: ["Espresso", "Steamed Milk", "Milk Foam"],
    image: "https://upload.wikimedia.org/wikipedia/commons/c/c8/Cappuccino_at_Sightglass_Coffee.jpg"
  },
  {
    id: 2,
    title: "Latte",
    description: "Espresso with steamed milk.",
    ingredients: ["Espresso", "Steamed Milk"],
    image: "https://upload.wikimedia.org/wikipedia/commons/7/7e/Cafe_Latte_with_heart.jpg"
  },
  {
    id: 3,
    title: "Espresso",
    description: "Strong black coffee made by forcing steam through ground coffee beans.",
    ingredients: ["Espresso"],
    image: "https://upload.wikimedia.org/wikipedia/commons/4/45/A_small_cup_of_coffee.JPG"
  },
  {
    id: 4,
    title: "Americano",
    description: "Espresso with hot water.",
    ingredients: ["Espresso", "Hot Water"],
    image: "https://upload.wikimedia.org/wikipedia/commons/d/db/Americano_coffee.jpg"
  },
  {
    id: 5,
    title: "Mocha",
    description: "Chocolate-flavored variant of a latte.",
    ingredients: ["Espresso", "Steamed Milk", "Chocolate Syrup", "Whipped Cream"],
    image: "https://upload.wikimedia.org/wikipedia/commons/f/f6/Mocha_coffee.jpg"
  },
  {
    id: 6,
    title: "Flat White",
    description: "Espresso with microfoam.",
    ingredients: ["Espresso", "Microfoam"],
    image: "https://upload.wikimedia.org/wikipedia/commons/7/72/Flat_white_coffee_with_leaf_pattern.jpg"
  },
  {
    id: 7,
    title: "Macchiato",
    description: "Espresso with a dash of foamed milk.",
    ingredients: ["Espresso", "Foamed Milk"],
    image: "https://upload.wikimedia.org/wikipedia/commons/8/88/Caffe_Macchiato.jpg"
  },
  {
    id: 8,
    title: "Cortado",
    description: "Equal parts espresso and warm milk.",
    ingredients: ["Espresso", "Warm Milk"],
    image: "https://upload.wikimedia.org/wikipedia/commons/4/45/Cortado_coffee.jpg"
  },
  {
    id: 9,
    title: "Affogato",
    description: "Espresso poured over a scoop of vanilla ice cream.",
    ingredients: ["Espresso", "Vanilla Ice Cream"],
    image: "https://upload.wikimedia.org/wikipedia/commons/b/bb/Affogato.jpg"
  },
  {
    id: 10,
    title: "Irish Coffee",
    description: "Coffee with Irish whiskey and cream.",
    ingredients: ["Coffee", "Irish Whiskey", "Sugar", "Cream"],
    image: "https://upload.wikimedia.org/wikipedia/commons/4/4d/Irish_Coffee_glass.jpg"
  },
  {
    id: 11,
    title: "Vienna",
    description: "Coffee topped with whipped cream.",
    ingredients: ["Coffee", "Whipped Cream"],
    image: "https://upload.wikimedia.org/wikipedia/commons/d/d0/Viennese_coffee.jpg"
  },
  {
    id: 12,
    title: "Turkish Coffee",
    description: "Finely ground coffee simmered in a pot.",
    ingredients: ["Finely Ground Coffee", "Water", "Sugar"],
    image: "https://upload.wikimedia.org/wikipedia/commons/f/fe/Turkish_Coffee_001.jpg"
  },
  {
    id: 13,
    title: "Cold Brew",
    description: "Coffee brewed cold for 12+ hours.",
    ingredients: ["Cold Brew Coffee", "Ice"],
    image: "https://upload.wikimedia.org/wikipedia/commons/4/45/Cold_Brew.jpg"
  },
  {
    id: 14,
    title: "Nitro Cold Brew",
    description: "Cold brew infused with nitrogen.",
    ingredients: ["Cold Brew Coffee", "Nitrogen"],
    image: "https://upload.wikimedia.org/wikipedia/commons/8/81/Nitro_Cold_Brew.jpg"
  },
  {
    id: 15,
    title: "Dalgona Coffee",
    description: "Whipped instant coffee over milk.",
    ingredients: ["Instant Coffee", "Sugar", "Hot Water", "Milk"],
    image: "https://upload.wikimedia.org/wikipedia/commons/7/7c/Dalgona_coffee.jpg"
  },
  {
    id: 16,
    title: "Café au Lait",
    description: "Equal parts brewed coffee and steamed milk.",
    ingredients: ["Brewed Coffee", "Steamed Milk"],
    image: "https://upload.wikimedia.org/wikipedia/commons/5/5f/Cafe_au_lait.jpg"
  },
  {
    id: 17,
    title: "Ristretto",
    description: "Short shot of espresso.",
    ingredients: ["Espresso"],
    image: "https://upload.wikimedia.org/wikipedia/commons/d/d9/Ristretto.jpg"
  },
  {
    id: 18,
    title: "Lungo",
    description: "Espresso with more water.",
    ingredients: ["Espresso", "Extra Water"],
    image: "https://upload.wikimedia.org/wikipedia/commons/f/f5/Cafe_Lungo.jpg"
  },
  {
    id: 19,
    title: "Breve",
    description: "Espresso with half-and-half.",
    ingredients: ["Espresso", "Half and Half"],
    image: "https://upload.wikimedia.org/wikipedia/commons/a/a4/Breve_Coffee.jpg"
  },
  {
    id: 20,
    title: "Iced Coffee",
    description: "Coffee served over ice.",
    ingredients: ["Brewed Coffee", "Ice"],
    image: "https://upload.wikimedia.org/wikipedia/commons/b/b7/Iced_coffee.jpg"
  },
  {
    id: 21,
    title: "Frappe",
    description: "Blended iced coffee with milk and sugar.",
    ingredients: ["Instant Coffee", "Milk", "Ice", "Sugar"],
    image: "https://upload.wikimedia.org/wikipedia/commons/d/dc/Greek_Frappe.jpg"
  },
  {
    id: 22,
    title: "Mazagran",
    description: "Cold sweetened coffee with lemon.",
    ingredients: ["Coffee", "Lemon", "Sugar", "Ice"],
    image: "https://upload.wikimedia.org/wikipedia/commons/f/f0/Mazagran_Coffee.jpg"
  },
  {
    id: 23,
    title: "Café Bombón",
    description: "Espresso with sweetened condensed milk.",
    ingredients: ["Espresso", "Sweetened Condensed Milk"],
    image: "https://upload.wikimedia.org/wikipedia/commons/a/ac/Cafe_bombon.jpg"
  },
  {
    id: 24,
    title: "Kopi Tubruk",
    description: "Boiled Indonesian-style coffee.",
    ingredients: ["Boiling Water", "Ground Coffee", "Sugar"],
    image: "https://upload.wikimedia.org/wikipedia/commons/7/71/Kopi_Tubruk.jpg"
  },
  {
    id: 25,
    title: "Bulletproof Coffee",
    description: "Coffee with butter and MCT oil.",
    ingredients: ["Coffee", "Butter", "MCT Oil"],
    image: "https://upload.wikimedia.org/wikipedia/commons/1/13/Bulletproof_Coffee.jpg"
  },
  {
    id: 26,
    title: "Red Eye",
    description: "Coffee with a shot of espresso.",
    ingredients: ["Drip Coffee", "Espresso"],
    image: "https://upload.wikimedia.org/wikipedia/commons/f/f2/Red_Eye_Coffee.jpg"
  },
  {
    id: 27,
    title: "Black Eye",
    description: "Coffee with two espresso shots.",
    ingredients: ["Drip Coffee", "2x Espresso"],
    image: "https://upload.wikimedia.org/wikipedia/commons/e/e9/Black_Eye_Coffee.jpg"
  },
  {
    id: 28,
    title: "Café Zorro",
    description: "Double espresso with hot water.",
    ingredients: ["Double Espresso", "Hot Water"],
    image: "https://upload.wikimedia.org/wikipedia/commons/c/c7/Cafe_Zorro.jpg"
  },
  {
    id: 29,
    title: "Café Cubano",
    description: "Sweetened Cuban espresso.",
    ingredients: ["Espresso", "Sugar"],
    image: "https://upload.wikimedia.org/wikipedia/commons/3/35/Cuban_coffee.jpg"
  },
  {
    id: 30,
    title: "Café de Olla",
    description: "Mexican spiced coffee.",
    ingredients: ["Coffee", "Cinnamon", "Piloncillo"],
    image: "https://upload.wikimedia.org/wikipedia/commons/b/b4/Cafe_de_olla.jpg"
  }
];

app.get('/api/coffees', (req, res) => {
  res.json(coffees);
});

app.listen(port, () => {
  console.log(`Coffee API running at http://localhost:${port}`);
});
