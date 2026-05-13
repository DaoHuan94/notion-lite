CREATE TABLE page_shares (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    page_id UUID NOT NULL REFERENCES pages(id) ON DELETE CASCADE,

    shared_by UUID NOT NULL REFERENCES users(id),

    public_token VARCHAR(255) UNIQUE,

    is_public BOOLEAN NOT NULL DEFAULT FALSE,

    expires_at TIMESTAMP,

    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);
