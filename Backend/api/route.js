import express from 'express';
import { userSchema, userUpdateSchema }  from '../schema/userSchema.js';
import { validate } from '../middleware/validate.js';

import {
    addUser,
    updateUser,
    getAllUser,
    getUserByEmail,
    deleteUser,
    login
} from "../controller/userController/mainController.js";

import { 
    getAllMenu

} from "../controller/menuController/mainController.js";

import { verifyToken } from "../middleware/Bearer.js";

const rt = express.Router();
// cek router
rt.get('/', (req, res) => {
    res.send('Hello World');
});
// Route Login
rt.post('/login', login);
rt.get("/user",verifyToken, getAllUser);
rt.post("/user-add", validate(userSchema), addUser);
rt.get("/get-user/:email", verifyToken ,getUserByEmail);
rt.patch("/update-user/:email",verifyToken , validate(userUpdateSchema), updateUser);
rt.delete("/delete-user/:email",verifyToken ,deleteUser);

// route menu
rt.get("/menu",verifyToken, getAllMenu);


export default rt