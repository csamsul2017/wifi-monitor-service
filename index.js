const express = require('express');
const cors = require('cors');
const { PrismaClient } = require('@prisma/client');
const { nanoid } = require('nanoid');

const app = express();
const prisma = new PrismaClient();
const port = 3000;

app.use(cors());
app.use(express.json());

app.post('/customer', async (req, res) => {
  const { gender, email, phone_number } = req.body;
  const customer_id = `customer-${nanoid(16)}`;

  try {
    const newCustomer = await prisma.customer.create({
      data: {
        customer_id,
        gender,
        email,
        phone_number,
      },
    });
    res.status(201).json({
      message: 'Customer saved',
      data: newCustomer,
    });
  } catch (error) {
    res.status(500).json({ error: 'Failed to save customer' });
  }
});

app.get('/customer', async (req, res) => {
  try {
    const customers = await prisma.customer.findMany();
    res.send(customers);
  } catch (error) {
    res.status(500).json({ error: 'Failed gets customer' });
  }
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
