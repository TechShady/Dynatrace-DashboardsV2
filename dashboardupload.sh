#!/bin/bash
if [[ $1 == "" || $2 == "" ]]; then
   echo "Usage: $0 tenant.live.dynatrace.com token"
   exit
fi

curl -X PUT "https://$1/api/config/v1/dashboards/7afde609-dbbe-486f-b2c0-0bde4c4d1d7c" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @AbandonsAnalysis.json
curl -X PUT "https://$1/api/config/v1/dashboards/65312f05-ca6c-4896-b2b4-1bc8ce334930" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @BookTravelFunnel.json
curl -X PUT "https://$1/api/config/v1/dashboards/6bf93529-3429-49f9-91e5-af799d375d69" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @BookTravelFunnelComparison.json
curl -X PUT "https://$1/api/config/v1/dashboards/ba9ecfe5-e7ec-451d-a187-060a724dde51" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @ConversionAnalysis.json
curl -X PUT "https://$1/api/config/v1/dashboards/6e481cc8-bea9-46ba-b1f8-23ebcc151088" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @EasyTravelOverview.json
curl -X PUT "https://$1/api/config/v1/dashboards/53fbfb05-1d8f-4577-a6c6-26c095703fe2" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @FunnelAnalysis-FinishDuration.json
curl -X PUT "https://$1/api/config/v1/dashboards/db169fdc-c9b1-4eee-b53a-1147fc9138fe" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @FunnelAnalysis-FinishErrors.json
curl -X PUT "https://$1/api/config/v1/dashboards/bc726e7a-ecda-4587-9aa3-7789a1d1aaff" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @FunnelAnalysis-HomeDuration.json
curl -X PUT "https://$1/api/config/v1/dashboards/359db0da-099b-4dca-b4c6-9620719a8400" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @FunnelAnalysis-HomeErrors.json
curl -X PUT "https://$1/api/config/v1/dashboards/99ecd03b-59d0-43d6-ad7d-9310619887b8" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @FunnelAnalysis-PaymentDuration.json
curl -X PUT "https://$1/api/config/v1/dashboards/5af45f7c-da9c-45b3-bff1-ca990b93c60f" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @FunnelAnalysis-PaymentError.json
curl -X PUT "https://$1/api/config/v1/dashboards/9ae42cfd-467b-4d0f-8577-3b887d2973d6" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @FunnelAnalysis-ReviewDuration.json
curl -X PUT "https://$1/api/config/v1/dashboards/3ed26550-95b2-43ee-ae87-60a77cd8d6ab" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @FunnelAnalysis-ReviewErrors.json
curl -X PUT "https://$1/api/config/v1/dashboards/757583a0-238e-4d95-8529-45a79a3393e0" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @LostRevenueComparison.json
curl -X PUT "https://$1/api/config/v1/dashboards/3e951fbb-3eb4-4f40-a5fe-61ce92ba96b2" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @ReleaseValidation.json
curl -X PUT "https://$1/api/config/v1/dashboards/f8c73b94-d5ef-4cbf-bcb8-d866c912630b" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @RevenueAnalysis.json
curl -X PUT "https://$1/api/config/v1/dashboards/0e3cddb6-f57b-4f86-a0ab-a31aab124f85" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @RevenueComparison.json
curl -X PUT "https://$1/api/config/v1/dashboards/848b2abd-d55f-4c2b-8f76-c6fe2afb439e" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token $2" -H "Content-Type: application/json; charset=utf-8" -d @RiskRevenueComparison.json
