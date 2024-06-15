package app.rbac

# By default, deny requests
default allow = false

# Allow access based on roles and permissions

# Permit policy for employees
allow {
    user_has_role[input.user, "employee"]
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

# Helper function to check if a user has a specific role
user_has_role(user, role) {
    data.users[user].roles[_] == role
}

# Data directly embedded in the policy file
data.users = {
    "john_doe": {
        "roles": ["employee"]
    },
    "jane_smith": {
        "roles": ["manager"]
    },
    "michael_lee": {
        "roles": ["senior_manager"]
    },
    "susan_clark": {
        "roles": ["employee"]
    },
    "tom_brown": {
        "roles": ["manager"]
    },
    "emma_wilson": {
        "roles": ["senior_manager"]
    }
}
