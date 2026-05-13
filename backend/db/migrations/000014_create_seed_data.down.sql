-- =========================================
-- DELETE ROLE PERMISSIONS
-- =========================================

DELETE FROM role_permissions
WHERE role_id IN (
    SELECT id
    FROM roles
    WHERE name IN (
        'owner',
        'admin',
        'editor',
        'viewer'
    )
);



-- =========================================
-- DELETE PERMISSIONS
-- =========================================

DELETE FROM permissions
WHERE name IN (

    'workspace:view',
    'workspace:update',
    'workspace:delete',

    'member:invite',
    'member:remove',
    'member:update_role',

    'page:create',
    'page:view',
    'page:update',
    'page:delete',

    'comment:create',
    'comment:delete'
);



-- =========================================
-- DELETE ROLES
-- =========================================

DELETE FROM roles
WHERE name IN (
    'owner',
    'admin',
    'editor',
    'viewer'
);