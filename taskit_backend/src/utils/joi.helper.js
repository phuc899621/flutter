export const joiMsg = (label, { min = null, max = null, email = null}) => {
  return {
    "string.empty": `${label} must not be empty`,
    "any.required": `${label} must be required`,
    ...(email && { "string.email": `${label} must be email` }),
    ...(min && { "string.min": `${label} must be at lest ${min} characters` }),
    ...(max  && { "string.max": `${label} must be less than ${max} characters` }),
  };
};