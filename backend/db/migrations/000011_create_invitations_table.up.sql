CREATE TABLE invitations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    workspace_id UUID NOT NULL REFERENCES workspaces(id) ON DELETE CASCADE,

    invited_by UUID NOT NULL REFERENCES users(id),

    email VARCHAR(255) NOT NULL,

    role_id UUID NOT NULL REFERENCES roles(id),

    token VARCHAR(255) NOT NULL UNIQUE,

    status VARCHAR(50) NOT NULL DEFAULT 'pending',

    expires_at TIMESTAMP NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);
