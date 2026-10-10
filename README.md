# Configuration d'une Solution basée sur Wazuh
Ce dépôt centralise l'ensemble des fichiers de configuration, des scripts de réponse et des règles de détection nécessaires au déploiement d'une solution complète de surveillance et de sécurité basée sur **Wazuh**. Elle intègre également la détection réseau avec **Suricata**, la surveillance du noyau Linux via **Auditd** et l'automatisation de la gestion d'incidents.

# Liste des Configurations Sauvegardées

Le projet est composé des fichiers stratégiques suivants :

# Gestionnaire et Détection (Wazuh)
ossec.conf : Fichier de configuration principal du gestionnaire et de l'agent de sécurité Wazuh.
local_rules.xml: Règles de détection personnalisées de Wazuh (alertes d'abus de commandes `sudo`, détection d'outils suspects LOLBins, requêtes PowerShell malveillantes, etc.).

# Réponse et Automatisation
kill-ssh-session.sh: Script d'Active Response configuré pour couper automatiquement les sessions SSH malveillantes en cas d'attaque brute-force.
Wazuh-to-TheHive.json: Modèle d'intégration de workflow pour l'envoi et la centralisation des alertes de sécurité vers la plateforme TheHive.
# Analyse Réseau et Système (Suricata & Auditd)
suricata.yaml: Fichier de configuration réseau principal de l'IDS/IPS Suricata.
local.rules: Règles d'alertes réseau personnalisées pour Suricata (scans de ports, requêtes suspectes).
audit.rules : Règles de surveillance de l'intégrité du système et du noyau Linux gérées par le démon `auditd`.

# Scénarios Sécurisés

Réponse Automatisée (Active Response) : Blocage et déconnexion en temps réel des attaquants tentant une force brute SSH.
Surveillance d'Intégrité (FIM) : Déclenchement d'alertes critiques lors de la modification de fichiers sensibles du système (`/etc/passwd`, `/etc/shadow`, `/etc/sudoers`).
Détection d'Intrusion Réseau (IDS): Analyse des flux pour intercepter les scans de ports (Nmap) et le trafic réseau illicite.
