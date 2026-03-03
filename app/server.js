const express = require('express');
const app = express();
app.use(express.json());

// Validar body exacto
function validBody(b) {
  return b &&
    typeof b.message === 'string' &&
    typeof b.to === 'string' &&
    typeof b.from === 'string' &&
    Number.isInteger(b.timeToLifeSec);
}

// Solo metodo POST permitido
app.post('/DevOps', (req, res) => {
  if (!validBody(req.body)) {
    return res.status(400).json({ error: "ERROR" });
  }

  return res.status(200).json({
    message: `Hello ${req.body.to} your message will be sent`
  });
});

// Cualquier método distinto de POST devuelve error
app.all('/DevOps', (req, res) => {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: "ERROR" });
  }
});

const port = process.env.PORT || 8080;
app.listen(port, () => console.log(`Listening on ${port}`));