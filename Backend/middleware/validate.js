export const validate = (schema) => (req, res, next) => {
    try {
        schema.parse(req.body); // Validasi body request dengan schema
        next(); // Lanjut ke handler jika validasi berhasil
    } catch (error) {
        res.status(400).json({
            errors: error.errors.map((e) => ({ field: e.path[0], message: e.message })),
        });
    }
};
