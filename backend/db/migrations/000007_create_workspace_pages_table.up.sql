CREATE TABLE pages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    workspace_id UUID NOT NULL REFERENCES workspaces(id) ON DELETE CASCADE,

    parent_page_id UUID REFERENCES pages(id) ON DELETE CASCADE,

    created_by UUID NOT NULL REFERENCES users(id),

    title VARCHAR(500) NOT NULL,

    icon TEXT,

    cover_image_url TEXT,

    is_archived BOOLEAN NOT NULL DEFAULT FALSE,

    is_locked BOOLEAN NOT NULL DEFAULT FALSE,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    deleted_at TIMESTAMP
);
