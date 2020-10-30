const jwt = require('jsonwebtoken');

export let generateToken: any = (user, secretSignature, tokenLife) => {
  return new Promise((resolve, reject) => {
      const userData = {
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        account: user.account,
        role: user.role
      };
      jwt.sign(
          {data: userData},
          secretSignature,
          {
            algorithm: "HS256",
            expiresIn: tokenLife,
          },
          (error, token) => {
            if (error) {
              return reject(error);
            }
            resolve(token);
        });
  })
}

export let verifyToken: any = (token, secretKey) => {
  return new Promise((resolve, reject) => {
    jwt.verify(token, secretKey, (error, decoded) => {
      if (error) {
        return reject(error);
      }
      resolve(decoded);
    });
  });
}