

const express = require('express');
const app = express();
const PORT = 3000;


app.get('/', (req, res) => {
   res.send('UptimeLens is alive.');
});


app.listen(PORT, () => {
   console.log(`UptimeLens running on port ${PORT}`);
});
