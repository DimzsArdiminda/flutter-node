import { PrismaClient } from "@prisma/client";
import { response } from "express";
import { body, validationResult } from 'express-validator';
import bcrypt from 'bcrypt';

const prisma = new PrismaClient();


// GET
export const getAllUser = async (req, res) => {
    try {
        const users = await prisma.user.findMany();
        res.status(200).json(users);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

// POST
export const addUser = async (req, res) => {
    const { name, email, password } = req.body; // Input sudah tervalidasi oleh middleware
    try {
        // Hash password sebelum disimpan
        const hashedPassword = await bcrypt.hash(password, 10);
        const user = await prisma.user.create({
            data: { 
                name,
                email,
                password : hashedPassword
            },
        });
        res.status(200).json(user);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

// GET
export const getUserByEmail = async (req, res) => {
    try {
        const response = await prisma.user.findUnique({
            where : {
                email: req.params.email
            }
        })
        res.status(200).json(response);
    } catch (error) {
        res.status(400).json({msg: error.message});
    }
}

// PUT
export const updateUser = async (req, res) => {
    const { name, password } = req.body; // Ambil data dari body
    const { email } = req.params; // Ambil email dari parameter URL

    try {
        // Hash password sebelum update
        const hashedPassword = await bcrypt.hash(password, 10);

        const response = await prisma.user.update({
            where: { email },
            data: {
                name,
                password: hashedPassword, // Simpan password yang sudah di-hash
            },
        });

        res.status(200).json(response); // Response sukses
    } catch (error) {
        res.status(400).json({ msg: `Update failed: ${error.message}` }); // Response gagal
    }
};


// DELETE
export const deleteUser = async (req, res) => {
    const { email } = req.params; // Mengambil email dari params (bukan body)
    try {
        // Menghapus user berdasarkan email
        const response = await prisma.user.delete({
            where: {
                email: email,  // Email yang diterima dari URL params
            },
        });
        res.status(200).json({
            message: 'User deleted successfully',
            deletedUser: response,  // Mengembalikan data user yang dihapus
        });
    } catch (error) {
        res.status(400).json({
            message: 'Error deleting user',
            error: error.message,
        });
    }
};
