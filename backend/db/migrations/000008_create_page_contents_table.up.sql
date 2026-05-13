
CREATE TABLE page_contents (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    page_id UUID NOT NULL UNIQUE REFERENCES pages(id) ON DELETE CASCADE,

    content JSONB NOT NULL,

    version INTEGER NOT NULL DEFAULT 1,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);
