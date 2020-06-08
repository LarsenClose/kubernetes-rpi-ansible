default:
		ansible-playbook --user pi --ask-pass password.yml
		ansible-playbook kubernets_go.yml 