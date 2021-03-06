.PHONY: deploy

# When run in gocd it will be injected by environment variable
AWS_ACCOUNT?=unknown

# Common variables
STATIC_ASSETS_FOLDER=static-assets

# Github variables
GITHUB_API=https://api.github.com
ORG=ukparliament
REPO=parliament.uk-static-assets-public

# Deploys to S3 without a version
deploy:
	aws s3 rm $(S3_BUCKET)/assets-public/* --recursive
	aws s3 sync --acl=public-read ./static-assets/ $(S3_BUCKET)/assets-public

