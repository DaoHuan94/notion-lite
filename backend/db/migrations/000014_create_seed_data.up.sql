-- =========================================
-- SEED ROLES
-- =========================================

INSERT INTO roles (name, description)
VALUES
('owner', 'Full workspace control'),
('admin', 'Manage workspace and members'),
('editor', 'Create and edit content'),
('viewer', 'Read-only access');



-- =========================================
-- SEED PERMISSIONS
-- =========================================

INSERT INTO permissions (name, description)
VALUES

('workspace:view', 'View workspace'),
('workspace:update', 'Update workspace'),
('workspace:delete', 'Delete workspace'),

('member:invite', 'Invite members'),
('member:remove', 'Remove members'),
('member:update_role', 'Update member role'),

('page:create', 'Create page'),
('page:view', 'View page'),
('page:update', 'Update page'),
('page:delete', 'Delete page'),

('comment:create', 'Create comment'),
('comment:delete', 'Delete comment');



-- =========================================
-- OWNER ROLE PERMISSIONS
-- =========================================

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
CROSS JOIN permissions p
WHERE r.name = 'owner';



-- =========================================
-- ADMIN ROLE PERMISSIONS
-- =========================================

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
JOIN permissions p
ON p.name IN (
    'workspace:view',
    'workspace:update',

    'member:invite',
    'member:remove',
    'member:update_role',

    'page:create',
    'page:view',
    'page:update',
    'page:delete',

    'comment:create',
    'comment:delete'
)
WHERE r.name = 'admin';



-- =========================================
-- EDITOR ROLE PERMISSIONS
-- =========================================

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
JOIN permissions p
ON p.name IN (
    'workspace:view',

    'page:create',
    'page:view',
    'page:update',

    'comment:create'
)
WHERE r.name = 'editor';



-- =========================================
-- VIEWER ROLE PERMISSIONS
-- =========================================

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
JOIN permissions p
ON p.name IN (
    'workspace:view',
    'page:view'
)
WHERE r.name = 'viewer';