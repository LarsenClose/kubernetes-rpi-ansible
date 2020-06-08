default:
		ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook --user pi --ask-pass password.yml
		ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook kubernets_go.yml 