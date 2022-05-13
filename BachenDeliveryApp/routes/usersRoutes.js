const UserController = require('../controllers/usersController');

module.exports = (app) => {
    // traer datos
    app.get('/api/users/getAll', UserController.getAll);

    // Guardar o crear datos
    app.post('/api/users/create', UserController.register);
    app.post('/api/users/login', UserController.login);
}