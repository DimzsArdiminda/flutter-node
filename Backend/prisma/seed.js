import { PrismaClient } from "@prisma/client";
import bcrypt from 'bcrypt';


const prismaMi = new PrismaClient();

async function main() {
    const hashedPassword = await bcrypt.hash('132456789', 10);
    const user = await prismaMi.user.upsert({
        where: {
            email: 'alice@prisma.io',
        },
        update: {},
        create: {
            email: 'alice@prisma.io',
            name: 'Alice',
            password: hashedPassword,
            Post: {
                create: [
                    {
                        title: 'Hello World',
                        content: 'This is my first post.',
                    },
                ],
            },
        },
    });

    const Usre2 = await prismaMi.user.upsert({
        where: {
            email: 'dimas@gmail',
        },
        update: {},
        create: {
            email: 'dimas',
            name: 'Dimas',
            password: hashedPassword,
            Post: {
                create: [
                    {
                        title: 'Hello World',
                        content: 'This is my first post.',
                    },
                ],
            },
        },
    });

    const makanan = await prismaMi.menu.upsert({
        where: {
            kode: "random2", // Gunakan ID unik di sini
        },
        update: {},
        create: {
            kode:"NasiGoreng",
            name: 'Nasi Goreng',
            price: 15000,
            stock: 100,
        },
    });
    
    const minuman = await prismaMi.menu.upsert({
        where: {
            kode: "random1", // Gunakan ID unik di sini
        },
        update: {},
        create: {
            kode:"EsTeh",
            name: 'Es Teh',
            price: 5000,
            stock: 100,
        },
    });
    

    console.log('User created or updated:', user, Usre2);
}

main()
    .catch((e) => {
        console.error(e);
        process.exit(1);
    })
    .finally(async () => {
        await prismaMi.$disconnect();
    });
