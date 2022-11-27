import string
from random import choice

from django.contrib.auth.models import User
from django.db import models

# Create your models here.


def generate_token():
    all_digits = string.digits + string.ascii_lowercase + string.ascii_uppercase
    return ''.join([choice(all_digits) for _ in range(30)])


class Token(models.Model):
    token = models.TextField(max_length=30, default=generate_token)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
