CREATE TABLE workspace_members (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    workspace_id UUID NOT NULL REFERENCES workspaces(id) ON DELETE CASCADE,

    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,

    role_id UUID NOT NULL REFERENCES roles(id),

    joined_at TIMESTAMP NOT NULL DEFAULT NOW(),

    UNIQUE(workspace_id, user_id)
);