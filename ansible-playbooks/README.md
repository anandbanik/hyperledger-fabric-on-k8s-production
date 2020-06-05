## To create Ansible roles, I have used Molecule:
https://molecule.readthedocs.io/en/latest/

Molecule project is designed to aid in the development and testing of Ansible roles.

Molecule provides support for testing with multiple instances, operating systems and distributions, virtualization providers, test frameworks and testing scenarios.

Molecule encourages an approach that results in consistently developed roles that are well-written, easily understood and maintained.

if you need a quick start, follow below steps:
```
# Install Ansible and Molecule

$ cd ansible-playbooks/applications
$ for example, you want to create a role called "deploy" inside test-application.
$ cd test-application/roles
$ molecule init role deploy

```