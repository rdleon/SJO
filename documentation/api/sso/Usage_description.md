# Single Sign On Usage

The Single Sign On service provides the hability to login, logout, create and manage
users and share credentials between several related services, it does this by
providing an API for common user interactions.

## Main features of the Single Sign On service

    * Login and out of a service
    * Create users
    * Manage created users (list, delete, edit)
    * Access to the user's data from other services

## Prefer mechanism to Sing on from other services Web UI

To use the Single Sign On mechanism (login in) from other services we can use an
iFrame to avoid the cross origin protetion schemes of the browser, we do so
by inserting an iFrame to the SSO (sso.example.com) inside of an iFrame in the
service we want to use (obras.example.com) and reading the user's JWT from the
parent into the iFrame, this will allow us to avoid having to re-sign-in the user
for each neaw service with a Web UI.

For other kinds of services we can share the JWT or simple send the credentials in
the case of automated tools.
