// server.js
const app = require('./app');
const {connectToMongodb} = require('./db/mongoose')

const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
  connectToMongodb()

});
