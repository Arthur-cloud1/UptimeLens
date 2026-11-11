

const express = require('express');
require('dotenv').config();
const { Pool } = require('pg');

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});
const app = express();
const PORT = 3000;


app.use(express.json());
app.use(express.static('public'));

app.get('/', (req, res) => {
   res.send('UptimeLens is alive.');
});
app.get('/db-test', async (req, res) => {
  try {
    const result = await pool.query('SELECT NOW()');
    res.send(`Database connected! Server time: ${result.rows[0].now}`);
  } catch (err) {
    res.status(500).send('Database connection failed: ' + err.message);
  }
});

app.post('/stats', async (req, res) => {
  try {
    const { disk_usage, memory_usage, uptime_seconds } = req.body;
    const result = await pool.query(
      'INSERT INTO server_stats (disk_usage, memory_usage, uptime_seconds) VALUES ($1, $2, $3) RETURNING *',
      [disk_usage, memory_usage, uptime_seconds]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Could not save reading' });
  }
});

app.get('/stats', async (req, res) => {
   try {
     const result = await pool.query('SELECT * FROM server_stats ORDER BY recorded_at DESC LIMIT 20');
     res.json(result.rows);
   } catch (err) {
     console.error(err);
     res.status(500).json({ error: 'Could not fetch readings' })
  }
});


app.post('/alerts', async (req, res) => {
  try {
    const { message, severity } = req.body;
    const result = await pool.query(
      'INSERT INTO alerts (message, severity) VALUES ($1, $2) RETURNING *',
      [message, severity]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Could not save alert' });
  }
});

app.get('/alerts', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM alerts ORDER BY created_at DESC LIMIT 20');
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Could not fetch alerts' });
  }
});


app.patch('/alerts/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const result = await pool.query(
      'UPDATE alerts SET resolved = true WHERE id = $1 RETURNING *',
      [id]
    );
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Alert not found' });
    }
    res.json(result.rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Could not update alert' });
  }
});
app.listen(PORT, () => {
   console.log(`UptimeLens running on port ${PORT}`);
});
