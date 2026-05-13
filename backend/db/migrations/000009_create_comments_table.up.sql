CREATE TABLE comments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    page_id UUID NOT NULL REFERENCES pages(id) ON DELETE CASCADE,

    user_id UUID NOT NULL REFERENCES users(id),

    content TEXT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    deleted_at TIMESTAMP
);