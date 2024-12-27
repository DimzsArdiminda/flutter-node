import { z } from 'zod';

export const userSchema = z.object({
    name: z.string().min(1, "Nama di butuhkan"),
    email: z.string().email("Email is invalid"),
    password: z.string().min(6, "Password must be at least 6 characters long"),
});

export const userUpdateSchema = z.object({
    name: z.string().min(1, "Nama di butuhkan"),
    password: z.string().min(6, "Password must be at least 6 characters long"),
});