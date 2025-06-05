import UserServices from '../services/user.services.js';

export const signup = async (req, res) => {
    try {
        const result=await UserServices.signup(req.body);
        return res.status(201).json(result);
    } catch (e) {
        let statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
};
export const signup_verify = async (req, res) => {
    try {
        const result =await UserServices.signup_verify(req.body);
        return res.status(201).json(result);
    } catch (e) {
        let statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
};

export const login = async (req, res) => {
    try {
        const result= await UserServices.login(req.body);
        return res.status(200).json({
            message: "Login successfully!",
            data: result
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
};

export const forgot_password = async (req, res) => {
    try {
        await UserServices.forgot_password(req.body);
        return res.status(201).json({
            message: "Verify otp for forgot password has been send to your email",
            data: {}
        });

    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
};

export const forgot_password_verify = async (req, res) => {
    try {
        const result =await UserServices.forgot_password_verify(req.body);
        return res.status(201).json({
                message: "Verify successfully!",
                data: {
                    resetToken: result,
                }
            });

    } catch (e) {
        const statusCode=e.statusCode||500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
};

export const forgot_password_reset = async (req, res) => {
    try {
        await UserServices.forgot_password_reset(req.headers['reset-token'], req.body);
        return res.status(201).json({
            message: "Reset password successfully!",
            data: {}
        });

    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
};

export const login_verify = async (req, res) => {
    try {
        const token = req.headers['authorization'].split(' ')[1];
        const result= await UserServices.login_verify(token);
        return res.status(200).json({
            message: "Token is valid!",
            data: result
        });
    } catch (e) {
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
};