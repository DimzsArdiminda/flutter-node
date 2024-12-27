import express from 'express';
import { userSchema, userUpdateSchema }  from '../schema/userSchema.js';
import { validate } from '../middleware/validate.js';

import {
    addUser,
    updateUser,
    getAllUser,
    getUserByEmail,
    deleteUser
} from "../controller/userController/mainController.js";


const rt = express.Router();
// cek router
rt.get('/', (req, res) => {
    res.send('Hello World');
});
rt.get("/user", getAllUser);
rt.post("/user-add", validate(userSchema), addUser);
rt.get("/get-user/:email", getUserByEmail);
rt.patch("/update-user/:email", validate(userUpdateSchema), updateUser);
rt.delete("/delete-user/:email", deleteUser);



export default rt