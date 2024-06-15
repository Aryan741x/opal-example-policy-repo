// Permit policy for employees
permit(
    principal in Role::"Employee",
    action in [
        Action::"work:view"
    ],
    resource in ResourceType::"work"
);

// Permit policy for managers
permit(
    principal in Role::"Manager",
    action in [
        Action::"work:create",
        Action::"work:view",
        Action::"work:mark_done"
    ],
    resource in ResourceType::"work"
);

// Permit policy for senior managers
permit(
    principal in Role::"SeniorManager",
    action in [
        Action::"work:create",
        Action::"work:view",
        Action::"work:mark_done",
        Action::"work:delete"
    ],
    resource in ResourceType::"work"
);
