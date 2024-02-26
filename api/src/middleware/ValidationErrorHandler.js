const { validationResult } = require("express-validator");

const validationErrorHandler = (req, res, next) => {
  const errors = validationResult(req); 
  if (!errors.isEmpty()) {
    // Check if there are any validation errors
    return res.status(400).json({ errors: errors.array() });
  }
  next();
};

module.exports =  validationErrorHandler ;
