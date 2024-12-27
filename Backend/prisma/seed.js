import { PrismaClient } from "@prisma/client";

const prismaMi = new PrismaClient();

async function main() {
    const user = await prismaMi.user.upsert({
        where: {
            email: 'alice@prisma.io',
        },
        update: {},
        create: {
            email: 'alice@prisma.io',
            name: 'Alice',
            password: 'securepassword',
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
            email: 'dimas',
        },
        update: {},
        create: {
            email: 'dimas',
            name: 'Dimas',
            password: 'securepassword',
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
