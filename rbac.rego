package app.rbac

# By default, deny requests
default allow = false

# Allow access based on roles and permissions

# Permit policy for employees
allow {
    some perm
    user_is_granted[perm]
    input.action == perm.action
    input.type == perm.type
}

# Permit policy for senior managers
allow {
    user_is_senior
}

user_is_senior{
    some i
    data.users[input.user].roles[i]=="senior_manager"
}

user_is_granted[perm]{
    some i
    role:=data.users[input.user].roles[i]
    perm:=data.role_permission[role][_]
}
