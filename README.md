# ovh-s3-deploy.

Deploy static website from react build to ovh s3 buckets.
Not tested on other object storage providers

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
        bucket: ${{ github.repository_owner }}-${{ github.event.repository.name }}
        source: build
```
