import AuthServices from '../services/auth.service.js';

export const signup = async (req, res) => {
    try {
        const result=await AuthServices.signup(req.body);
        return res.status(201).json({
            message: "Signup successfully! Please verify your email",
            data: result
        });
    } catch (e) {
        let statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
};
export const verifySignup = async (req, res) => {
    try {
        const {id,otp} = req.body;
        await AuthServices.verifySignup(id, otp);
        return res.status(200).json({
            message: "Verify your account successfully!",
            data: {}
        });
    } catch (e) {
        let statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: e.message,
            data: {}
        });
    }
};
export const resendSignupOtp = async (req, res) => {
    try {
        const {id} = req.body;
        await AuthServices.resendSignupOtp(id);
        return res.status(200).json({
            message: "Verify otp for signup has been send to your email",
            data: {}
        });
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
        const result= await AuthServices.login(req.body);
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

export const forgotPassword = async (req, res) => {
    try {
        await AuthServices.forgotPassword(req.body);
        return res.status(201).json({
            message: "OTP for verify has been send to your email!",
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

export const forgotPasswordVerify = async (req, res) => {
    try {
        const result =await AuthServices.forgotPasswordVerify(req.body);
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

export const resetPassword = async (req, res) => {
    try {
        await AuthServices.resetPassword(req.body);
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