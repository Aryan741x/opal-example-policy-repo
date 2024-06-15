package app.rbac

# By default, deny requests
default allow = false

# Allow access based on roles and permissions

# Permit policy for employees
allow {
    some permission
    user_is_granted[permission]
    input.action == permission.action
    input.type == permission.type
}

# Permit policy for senior managers
allow {
    user_is_senior
}

user_is_senior{
    some i
    data.users[input.user].roles[i]=="senior_manager"
}

user_is_granted[permission]{
    some i,j
    role:=data.users[input.user].roles[i]
    permission:=data.role_permission[role][j]
}
