default:
		ansible-playbook --user pi --ask-pass password.yml
		ansible-playbook --ask-pass kubernets_go.yml