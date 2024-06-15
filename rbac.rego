package app.rbac

# By default, deny requests
default allow = false

allow {
    user_is_senior
}

user_is_senior{
    some i
    data.users[input.user].roles[i]=="senior_manager"
}
