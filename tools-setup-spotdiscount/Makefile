infra:
	git pull
	terraform init
	terraform apply -auto-approve

ansible:
	git pull
	ansible-playbook -i $(tool_name)-int.vidyapractice.shop, -e ansible_user=testing -e ansible_password=Password@1234 tool_setup.yml -e tool_name=$(tool_name)