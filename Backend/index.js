import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import rt from "./api/route.js";


dotenv.config();
const app = express();

app.use(cors());
app.use(express.json());
app.use(rt);


// lokal port
// app.listen(
//     process.env.PORT,() => {
//         console.log(`Server is running on port ${process.env.PORT}`);
//     }
// )

// use IP and PORT from .env
// Default port and host
const PORT = process.env.PORT;
const HOST = process.env.IP_ADDRES ;

// Start server
app.listen(process.env.PORT, process.env.IP_ADDRES, () => {
    console.log(`Server running at http://${process.env.IP_ADDRES}:${process.env.PORT}`);
});


