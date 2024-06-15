// Permit policy for employees
permit(
    principal in Role::"Employee",
    action in [
        Action::"document:view"
    ],
    resource in ResourceType::"document"
);

// Permit policy for managers
permit(
    principal in Role::"Manager",
    action in [
        Action::"document:create",
        Action::"document:view",
        Action::"document:mark_done"
    ],
    resource in ResourceType::"document"
);

// Permit policy for senior managers
permit(
    principal in Role::"SeniorManager",
    action in [
        Action::"document:create",
        Action::"document:view",
        Action::"document:mark_done",
        Action::"document:delete"
    ],
    resource in ResourceType::"document"
);
