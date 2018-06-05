from rest_framework import serializers
from rest_framework.serializers import ModelSerializer
from app01 import models
# Create your views here.

class PricePolicySerializers(ModelSerializer):
    ""
    class Meta:
        model = models.PricePolicy
        fields = '__all__'