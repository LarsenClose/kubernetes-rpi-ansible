default:
		ansible-playbook --user pi --ask-pass change_default_password.yml
		ansible-playbook --ask-pass kubernets_go.yml