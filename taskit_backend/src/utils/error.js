export class BaseError extends Error {
  constructor(statusCode, message) {
    super(message);

    this.statusCode = statusCode;
    this.type = this.constructor.name;

    Error.captureStackTrace(this, this.constructor);
  }
}
export class ServerError extends BaseError {
  constructor(message = "Server error") {
    super(500, message);
  }
}

export class NotFoundError extends BaseError {
  constructor(message = "Not found") {
    super(404, message);
  }
}

export class ConflictError extends BaseError {
  constructor(message = "Conflict") {
    super(409, message);
  }
}

export class ValidationError extends BaseError {
  constructor(message = "Validation failed") {
    super(400, message);
  }
}
export class BadRequestError extends BaseError {
  constructor(message = "Bad request") {
    super(400, message);
  }
}
export class AuthenticationError extends BaseError {
  constructor(message = "Authentication failed") {
    super(401, message);
  }
}

export class AuthorizationError extends BaseError {
  constructor(message = "Authorization failed") {
    super(403, message);
  }
}
export class DatabaseError extends BaseError {
  constructor(message = "Database error") {
    super(500, message);
  }
}
