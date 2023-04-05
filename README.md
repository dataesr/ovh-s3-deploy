# kubectl-deploy.

From https://github.com/myrotvorets/kubectl-action

Make our own to have control over entrypoint.sh

## Usage

```
deploy:
  runs-on: ubuntu-latest
  needs: ['build']
  steps:
    - name: Check Out Repo
      uses: actions/checkout@v2
    - name: Deploy to s3
      uses: dataesr/ovh-s3-deploy@v1
      with:
        access_key: ${{ secrets.S3_ACCESS_KEY }}
        secret_key: ${{ secrets.S3_SECRET_KEY }}
        region: gra
        endpoint: https://s3.gra.io.cloud.ovh.net
        bucket: ${{ github.repository }}
        source: build
```
