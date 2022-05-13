const User = require('../models/user');
const Rol = require('../models/rol');
const jwt = require('jsonwebtoken');
const keys = require('../config/keys');

module.exports = {
    async getAll(req, res, next){
        try {
            const data = await User.getAll();
            console.log(`Usuarios: ${data}`);
            return res.status(201).json(data);
        } catch (error) {
            console.log(`error: ${error}`);
            return res.status(501).json({
                success:false,
                message: 'error al obtener los usuarios'
            });
        }
    },
    
    async register(req, res, next){
        try {
            const user = req.body;
            const data = await User.create(user);

            await Rol.create(data.id, 1); //ROL POR DEFECTO (CLIENTE)

            return res.status(201).json({
                success:true,
                messaje: 'El registro se realizo correctamente, ahora inicia sesion',
                data: data.id
            })
        } catch (error) {
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success:false,
                messaje: 'Hubo un error con el registro del usuario',
                error: error
            })
        }
    },
    // metodo de login 
    async login(req, res, next){
        try {
            const email = req.body.email;
            const password = req.body.password;
            const Myuser = await User.findByEmail(email);

            if (!Myuser){
                return res.status(401).json({
                    success: false,
                    message: 'El email no fue encontrado'
                })
            }

            if (User.isPasswordMatched(password, Myuser.password)){
                const token = jwt.sign({id: Myuser.id, email: Myuser.email}, keys.secretOrkey,{
                    // expiresIn: (60*60*24) // 1 HORA
                });

                const data = {
                    id: Myuser.id,
                    name: Myuser.name,
                    lastname: Myuser.lastname,
                    email: Myuser.email,
                    phone: Myuser.phone,
                    image: Myuser.image,
                    session_token: `JWT ${token}`
                }
                return res.status(201).json({
                    success: true,
                    data: data ,
                    message: 'El usuario a sido autenticado'
                });
            }
            else{
                return res.status(401).json({
                    success: false,
                    message: 'La contraseña es incorrecta',
                });
            }

        } catch (error) {
            console.log(`erro: ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Error al momento de hacer login',
                error: error
            })
        }
    }

}