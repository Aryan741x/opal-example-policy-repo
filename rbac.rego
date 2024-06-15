package app.rbac

# By default, deny requests
default allow = false

# Allow access based on roles and permissions

# Permit policy for employees
allow {
    some i,permission
    user_is_granted[permission]
    input.action == "work:view"
    input.resource == "work"
}

# Permit policy for managers
allow {
    user_has_role[input.user, "manager"]
    input.action == "work:create"
    input.resource == "work"
}

allow {
    user_has_role[input.user, "manager"]
    input.action == "work:view"
    input.resource == "work"
}

allow {
    user_has_role[input.user, "manager"]
    input.action == "work:mark_done"
    input.resource == "work"
}

# Permit policy for senior managers
allow {
    user_has_role[input.user, "senior_manager"]
    input.action == "work:create"
    input.resource == "work"
}

allow {
    user_has_role[input.user, "senior_manager"]
    input.action == "work:view"
    input.resource == "work"
}

allow {
    user_has_role[input.user, "senior_manager"]
    input.action == "work:mark_done"
    input.resource == "work"
}

allow {
    user_has_role[input.user, "senior_manager"]
    input.action == "work:delete"
    input.resource == "work"
}
