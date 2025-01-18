import { PrismaClient } from "@prisma/client";
import { response } from "express";
import { body, validationResult } from 'express-validator';
import bcrypt from 'bcrypt';
import dotenv from 'dotenv';
import jwt from 'jsonwebtoken';

const prisma = new PrismaClient();
dotenv.config();



// login

export const login = async (req, res) => {
    const { emailUser, pass } = req.body;

    try {
        // Validasi input
        if (!emailUser || !pass) {
            return res.status(400).json({ msg: 'Email dan password harus diisi' });
        }

        // Cari user di database berdasarkan email
        const user = await prisma.user.findUnique({
            where: { email: emailUser },
        });

        // Jika user tidak ditemukan
        if (!user) {
            return res.status(404).json({ msg: 'User tidak ditemukan' });
        }

        // Verifikasi password menggunakan bcrypt
        const isPasswordValid = await bcrypt.compare(pass, user.password);
        if (!isPasswordValid) {
            return res.status(401).json({ msg: 'Password salah' });
        }

        // Buat token JWT
        const token = jwt.sign(
            { id: user.id, email: user.email }, // Payload
            process.env.CODE_GEN_SECRET,       // Secret key
            { expiresIn: '1h' }                // Masa berlaku token
        );

        // Simpan token dalam cookie
        res.cookie('token', token, {
            httpOnly: true,
            secure: process.env.NODE_ENV === 'production', // Hanya untuk HTTPS jika di production
            sameSite: 'strict',
            maxAge: 3600000, // 1 jam
        });

        res.status(200).json({
            msg: 'Login berhasil',
            token, // Bisa dikirimkan juga jika diperlukan di frontend
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ msg: 'Terjadi kesalahan pada server' });
    }
};




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
