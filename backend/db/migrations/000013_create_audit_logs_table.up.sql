CREATE TABLE audit_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    actor_id UUID REFERENCES users(id),

    workspace_id UUID REFERENCES workspaces(id),

    action VARCHAR(255) NOT NULL,

    entity_type VARCHAR(100),

    entity_id UUID,

    metadata JSONB,

    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);
