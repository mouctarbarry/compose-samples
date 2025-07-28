#!/bin/sh

# Créer le répertoire et définir les permissions
mkdir -p /vault/data
chown -R vault:vault /vault/data
chmod -R 755 /vault/data

# Démarrer Vault en tant qu'utilisateur vault
exec su-exec vault vault server -config=/vault/config/vault.hcl
