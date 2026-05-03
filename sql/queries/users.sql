-- name: CreateUser :one
INSERT INTO users (id, created_at, updated_at, email, hashed_password, is_chirpy_red)
VALUES (
    gen_random_uuid(),
    NOW(),
    NOW(),
    $1,
    $2,
    FALSE
)
RETURNING *;

-- name: GetUserByID :one
SELECT * FROM users
WHERE id = $1;

-- name: GetUserByEmail :one
SELECT * FROM users
WHERE email = $1;

-- name: UpdateUserEmail :one
UPDATE users
SET email = $1, updated_at = NOW()
WHERE id = $2
RETURNING *;

-- name: UpdateUserPassword :one
UPDATE users
SET hashed_password = $1, updated_at = NOW()
WHERE id = $2
RETURNING *;

-- name: UpdateUserIsChirpyRed :one
UPDATE users
SET is_chirpy_red = TRUE, updated_at = NOW()
WHERE id = $1
RETURNING *;