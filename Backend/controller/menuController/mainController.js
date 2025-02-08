import { PrismaClient } from "@prisma/client";
import { response } from "express";
import { body, validationResult } from 'express-validator';
import bcrypt from 'bcrypt';
import dotenv from 'dotenv';
import jwt from 'jsonwebtoken';

const prisma = new PrismaClient();
dotenv.config();


export const getAllMenu = async (req, res) => {
    try {
        const users = await prisma.menu.findMany();
        res.status(200).json(users);
    } catch (error) {
        res.status(400).send(error.message);
    }
}